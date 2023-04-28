//
//  Route.swift
//  shout
//
//  Created by 김록원 on 2023/04/28.
//

import Foundation

protocol Route: Equatable { }


enum BaseRoute: Route {
  case myShout
  case writeShout
  case writeWiseSaying
}
