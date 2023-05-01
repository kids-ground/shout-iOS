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
    var buttonSectionState = ButtonSectionCore.State()
    
    var scrollOffsetY: CGFloat = 0.0
    var isHeaderTransParent = false
  }
  
  enum Action: Equatable {
    case buttonSectionAction(ButtonSectionCore.Action)
    
    case mainListScrolled(CGFloat)
    case scrollDebounceCompleted(CGFloat)
    case routeAction(BaseRoute)
  }
  
  struct ThrottleId: Hashable {}
  
  var body: some ReducerProtocol<State, Action> {
    Scope(state: \.buttonSectionState, action: /Action.buttonSectionAction) {
      ButtonSectionCore()
    }
    Reduce { state, action in
      switch action {
      case .mainListScrolled(let offsetY):
        return .task { .scrollDebounceCompleted(offsetY) }
          .throttle(id: ThrottleId(), for: 0.2, scheduler: DispatchQueue.main, latest: true)
      case .scrollDebounceCompleted(let offsetY):
        if state.isHeaderTransParent != (offsetY >= 10) {
          state.isHeaderTransParent.toggle()
        }
        return .none
      case let .buttonSectionAction(.routeAction(route)):
        return .task { .routeAction(route) }
      case .routeAction(_):
        return .none
      }
    }
    
  }
}
