//
//  TabBarItem.swift
//  shout
//
//  Created by 김록원 on 2023/04/25.
//

import Foundation

enum TabBarItem: String, CaseIterable {
  case home
  case postList
  case setting
  
  var title: String {
    switch self {
    case .home:
      return "홈"
    case .postList:
      return "포스트"
    case .setting:
      return "프로필"
    }
  }
  
  var imageName: String {
    switch self {
    case .home:
      return "home"
    case .postList:
      return "book"
    case .setting:
      return "user"
    }
  }
}
