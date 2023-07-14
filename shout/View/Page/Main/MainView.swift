//
//  MainView.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI
import ComposableArchitecture
import KakaoSDKCommon
import KakaoSDKAuth

struct MainView: View {
  let store: StoreOf<MainCore>
  
  init(store: StoreOf<MainCore>) {
    self.store = store
    UITabBar.appearance().isHidden = true
  }
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationStack(
        path: viewStore.binding(
          get: \.router,
          send: MainCore.Action.routeChange
        )
      ) {
        TabView(selection: viewStore.binding(
          get: \.tabBarState.selectedTab,
          send: MainCore.Action.selectTab)
        ) {
          HomeView(
            store: store.scope(
              state: \.homeState,
              action: MainCore.Action.homeAction
            )
          )
            .background(Color.dark700)
            .tag(TabBarItem.home)
            .safeAreaInset(edge: .bottom) {
              VStack{}.frame(height: TabBarView.originalTabBarHeight)
            }
          
          PostListView()
            .background(Color.dark700)
            .tag(TabBarItem.postList)
            .safeAreaInset(edge: .bottom) {
              VStack{}.frame(height: TabBarView.originalTabBarHeight)
            }
          
          ProfileView()
            .background(Color.dark700)
            .tag(TabBarItem.setting)
            .safeAreaInset(edge: .bottom) {
              VStack{}.frame(height: TabBarView.originalTabBarHeight)
            }
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
        .edgesIgnoringSafeArea(.bottom)
        .navigationDestination(for: BaseRoute.self) { value in
          Text("g2")
        }
        .sheet(isPresented: viewStore.binding(
          get: \.showLoginView,
          send: MainCore.Action.loginViewDismiss)
        ) {
          LoginView(
            store: store.scope(
              state: \.loginState,
              action: MainCore.Action.loginAction
            )
          )
        }
      }
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
