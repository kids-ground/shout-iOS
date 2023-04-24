//
//  MainView.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI

enum Tab {
  case home
  case bookmark
  case user
}

struct MainView: View {
  
  @State private var tabSelection = Tab.home
  
  
  var body: some View {
    NavigationView {
      TabView(selection: $tabSelection) {
        HomeView()
          .background(Color.dark700)
          .tag(Tab.home)
        
        BookmarkView()
          .background(Color.dark700)
          .tag(Tab.bookmark)
        
        ProfileView()
          .background(Color.dark700)
          .tag(Tab.user)
      }
      .accentColor(.white)
      .overlay(alignment: .bottom) {
        TabBarView()
      }
      .edgesIgnoringSafeArea(.all)
    }
    .navigationViewStyle(.stack)
    .navigationBarHidden(false)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
    .preferredColorScheme(.dark)
  }
}
