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
  }
  
  enum Action: Equatable {
    case tabBarAction(TabBarCore.Action)
    case selectTab(TabBarItem)
  }
  
  var body: some ReducerProtocol<State, Action> {
    Scope(state: \.tabBarState, action: /Action.tabBarAction) {
      TabBarCore()
    }
    Reduce { state, action in
      return .none
    }
  }
}


