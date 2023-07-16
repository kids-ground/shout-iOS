//
//  NetworkManager.swift
//  shout
//
//  Created by 김록원 on 2023/07/15.
//

import Foundation
import Moya


enum UserService {
  case login(requst: LoginRequestDto)
}

extension UserService: TargetType {
  var baseURL: URL {
    URL(string: "http://localhost:8080")!
  
  }
  
  var path: String {
    switch self {
    case .login(_):
      return "/members"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .login:
      return .post
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .login(let request):
      return .requestJSONEncodable(request)
    }
  }
  
  var headers: [String : String]? {
    return [
      "Content-type": "application/json"
    ]
  }
}
