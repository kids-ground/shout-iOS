//
//  ButtonSectionCore.swift
//  shout
//
//  Created by 김록원 on 2023/04/27.
//

import SwiftUI
import ComposableArchitecture

struct ButtonSectionCore: ReducerProtocol {
  struct State: Equatable {
  }
  
  enum Action: Equatable {
    case routeAction(BaseRoute)
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .routeAction(_):
      return .none
    }
  }
}
