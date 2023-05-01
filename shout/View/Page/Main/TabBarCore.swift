//
//  TabBarCore.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI
import ComposableArchitecture

struct TabBarCore: ReducerProtocol {
  struct State: Equatable {
    var selectedTab = TabBarItem.home
  }
  
  enum Action: Equatable {
    case selectedTabChange(TabBarItem)
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .selectedTabChange(let selectedTab):
      state.selectedTab = selectedTab
      return .none
    }
  }
}
