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

struct LoginCore: ReducerProtocol {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    case kakaoLoginTap
    case successKakaoLogin(String)
    case failureKakaoLogin
    case successAppleLogin(String)
    case failureAppleLogin
  }
  
  func reduce(into state: inout State, action: Action) -> ComposableArchitecture.EffectTask<Action> {
    switch action {
    case .kakaoLoginTap:
      if (UserApi.isKakaoTalkLoginAvailable()) {
        UserApi.shared.loginWithKakaoTalk{ oauthToken, err in
          if let err = err {
            print(err)
          } else {
            print("카카오 로그인 \(oauthToken?.accessToken ?? "실패")")
          }
        }
      } else {
        UserApi.shared.loginWithKakaoAccount{ oauthToken, err in
          if let err = err {
            print(err)
          } else {
            print("카카오 로그인 \(oauthToken?.accessToken ?? "실패")")
          }
        }
      }
      return .none
    case let .successKakaoLogin(accessToken):
      return .none
    case let .successAppleLogin(identityToken):      
      return .none
    case .failureAppleLogin, .failureKakaoLogin:
      return .none
    }
  }
}
