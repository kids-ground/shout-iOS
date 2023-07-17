//
//  LoginRequestDto.swift
//  shout
//
//  Created by 김록원 on 2023/07/15.
//

import Foundation

enum OAuthType: String, Codable {
  case KAKAO
  case APPLE
}

struct LoginRequestDto: Encodable {
  let token: String
  let oauthType: OAuthType
}
