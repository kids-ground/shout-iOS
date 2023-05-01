//
//  MainViewCore.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI
import ComposableArchitecture

struct MainCore: ReducerProtocol {
  struct State: Equatable {
    var tabBarState = TabBarCore.State()
    var homeState = HomeCore.State()
    var router: [BaseRoute] = []
  }
  
  enum Action: Equatable {
    case tabBarAction(TabBarCore.Action)
    case homeAction(HomeCore.Action)
    
    case selectTab(TabBarItem)
    case routeChange([BaseRoute])
  }
  
  var body: some ReducerProtocol<State, Action> {
    Scope(state: \.tabBarState, action: /Action.tabBarAction) {
      TabBarCore()
    }
    Scope(state: \.homeState, action: /Action.homeAction) {
      HomeCore()
    }
    Reduce { state, action in
      switch action {
      case let .homeAction(.routeAction(route)):
        state.router.append(route)
        return .none
      case let .routeChange(route):
        state.router = route
        return .none
      default:
        return .none
      }
    }
  }
}


