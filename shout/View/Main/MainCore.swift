//
//  MainViewCore.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI
import ComposableArchitecture


struct MainState: Equatable {
  
  
}

enum MainAction: Equatable {
  
}

struct MainEnvironment {
  
}

let mainReducer: Reducer<MainState, MainAction, MainEnvironment> = .combine(
  .init { state, conbine, env in
    return .none
  }
)
