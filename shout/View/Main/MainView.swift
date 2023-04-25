//
//  MainView.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
  let store: StoreOf<MainCore>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationView {
        TabView(selection: viewStore.binding(
          get: \.tabBarState.selectedTab,
          send: MainCore.Action.selectTab)
        ) {
          HomeView()
            .background(Color.dark700)
            .tag(TabBarItem.home)
          
          BookmarkView()
            .background(Color.dark700)
            .tag(TabBarItem.bookmark)
          
          ProfileView()
            .background(Color.dark700)
            .tag(TabBarItem.setting)
        }
        .accentColor(.white)
        .overlay(alignment: .bottom) {
          TabBarView(
            store: store.scope(
              state: \.tabBarState,
              action: MainCore.Action.tabBarAction
            )
          )
        }
        .edgesIgnoringSafeArea(.all)
      }
      .navigationViewStyle(.stack)
      .navigationBarHidden(false)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(store: Store(
      initialState: MainCore.State(),
      reducer: MainCore()
      )
    )
    .preferredColorScheme(.dark)
  }
}
