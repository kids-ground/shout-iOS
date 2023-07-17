//
//  LoginCore.swift
//  shout
//
//  Created by 김록원 on 2023/07/14.
//

import SwiftUI
import ComposableArchitecture
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices
import Moya

struct LoginCore: ReducerProtocol {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    static func == (lhs: LoginCore.Action, rhs: LoginCore.Action) -> Bool {
      false
    }
    
    case kakaoLoginTap
    case failureKakaoLogin(message: String)
    case failureAppleLogin(message: String)
    
    case fetchSignUp(oAuthType: OAuthType, token: String)
    case successSignUp(response: MemberReponseDto)
    case failureSignUp(message: String)
  }


  let userService = MoyaProvider<UserService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
  
  
  func reduce(into state: inout State, action: Action) -> ComposableArchitecture.EffectTask<Action> {
    switch action {
    case .kakaoLoginTap:
      return .task(priority: .userInitiated) {
        let kakaoAccessToken = await withCheckedContinuation { continuation in
          DispatchQueue.main.async {
            if (UserApi.isKakaoTalkLoginAvailable()) {
              UserApi.shared.loginWithKakaoTalk { oauthToken, err in
                continuation.resume(returning: oauthToken?.accessToken)
              }
            } else {
              UserApi.shared.loginWithKakaoAccount { oauthToken, err in
                continuation.resume(returning: oauthToken?.accessToken)
              }
            }
          }
        }
        
        guard let token = kakaoAccessToken else { return .failureKakaoLogin(message: "토큰 없음") }
        return .fetchSignUp(oAuthType: .KAKAO, token: token)
      }
    case let .fetchSignUp(oauthType, token):
      return .task {
        let request = LoginRequestDto(token: token, oauthType: oauthType)
        let result = await userService.request(.login(requst: request))

        switch result {
        case .failure(let err):
          print(err)
          return .failureSignUp(message: "SignUp API 실패")
        case .success(let response):
          guard let responseData = try? response.map(MemberReponseDto.self) else { return .failureSignUp(message: "DTO 직렬화 실패")}
          return .successSignUp(response: responseData)
        }
      } catch: { (err) in
        return .failureSignUp(message: "통신 실패")
      }
    case .failureAppleLogin(let message):
      print("애플 로그인 에러 발생 \(message)")
      return .none
    case .failureKakaoLogin(let message):
      print("카카오 로그인 에러 발생 \(message)")
      return .none
    case .failureSignUp(let message):
      print(message)
      return .none
    case let .successSignUp(response):
      print("SignUP API 성공")
      print(response.token.accessToken)
      return .none
    }
    
  }
}
