//
//  shoutApp.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct shoutApp: App {
  @Environment(\.colorScheme) var colorScheme
  
  var body: some Scene {
    WindowGroup {
      MainView(store: Store(
        initialState: MainCore.State(),
        reducer: MainCore())
      )
        .preferredColorScheme(.dark)
        .background(Color.dark700)
    }
  }
}
