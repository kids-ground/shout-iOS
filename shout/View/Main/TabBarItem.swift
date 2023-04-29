//
//  TabBarItem.swift
//  shout
//
//  Created by 김록원 on 2023/04/25.
//

import Foundation

enum TabBarItem: String, CaseIterable {
  case home
  case bookmark
  case setting
  
  var title: String {
    switch self {
    case .home:
      return "홈"
    case .bookmark:
      return "외침"
    case .setting:
      return "프로필"
    }
  }
  
  var imageName: String {
    switch self {
    case .home:
      return "home"
    case .bookmark:
      return "bookmark"
    case .setting:
      return "user"
    }
  }
}
