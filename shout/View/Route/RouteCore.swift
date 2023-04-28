//
//  RouteCore.swift
//  shout
//
//  Created by 김록원 on 2023/04/28.
//

import SwiftUI
import ComposableArchitecture

struct RouteCore: ReducerProtocol {
  struct State: Equatable {
    var tabBarState = TabBarCore.State()
    var homeState = HomeCore.State()
  }
  
  enum Action: Equatable {
    case tabBarAction(TabBarCore.Action)
    case homeAction(HomeCore.Action)
    
    case selectTab(TabBarItem)
  }
  
  var body: some ReducerProtocol<State, Action> {
    Scope(state: \.tabBarState, action: /Action.tabBarAction) {
      TabBarCore()
    }
    Scope(state: \.homeState, action: /Action.homeAction) {
      HomeCore()
    }
    Reduce { state, action in
      return .none
    }.ifLet(\.ho, action: <#T##CasePath<_, ReducerProtocol.Action>#>, then: <#T##() -> ReducerProtocol#>)
  }
}


