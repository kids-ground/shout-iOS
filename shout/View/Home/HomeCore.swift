//
//  HomeCore.swift
//  shout
//
//  Created by 김록원 on 2023/04/26.
//

import SwiftUI
import ComposableArchitecture

struct HomeCore: ReducerProtocol {
  struct State: Equatable {
    var scrollOffsetY: CGFloat = 0.0
    var isHeaderTransParent = false
  }
  
  enum Action: Equatable {
    case mainListScrolled(CGFloat)
    case scrollDebounceCompleted(CGFloat)
  }
  
  struct ThrottleId: Hashable {}
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .mainListScrolled(let offsetY):
      return .task { .scrollDebounceCompleted(offsetY) }
      .throttle(id: ThrottleId(), for: 0.3, scheduler: DispatchQueue.main, latest: true)
    case .scrollDebounceCompleted(let offsetY):
      if state.isHeaderTransParent != (offsetY >= 10) {
        state.isHeaderTransParent.toggle()
      }
      return .none
    }
  }
}
