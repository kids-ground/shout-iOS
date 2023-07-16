//
//  MemberResponseDto.swift
//  shout
//
//  Created by 김록원 on 2023/07/15.
//

import Foundation

class MemberReponseDto: Decodable {
  let id: Int64
  let token: TokenDto
}

extension MemberReponseDto {
  struct TokenDto: Decodable {
    let accessToken: String
    let refreshToken: String
  }
}
