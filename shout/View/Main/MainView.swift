//
//  MainView.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI

struct MainView: View {
  enum Tab {
    case home
    case bookmark
    case setting
  }
  
  init() {
    UITabBar.appearance().unselectedItemTintColor = UIColor.darkGray
    UITabBar.appearance().backgroundColor = UIColor.black
  }
  
  @State private var tabSelection = Tab.home
  
  
  var body: some View {
    
    NavigationView {
      TabView(selection: $tabSelection) {
        HomeView()
          .clipped()
          .background(Color.dark700)
          .tag(Tab.home)
          .tabItem{
            VStack {
              Image("home")
                .renderingMode(.template)
                .imageScale(.large)
              Text("홈")
            }
          }
          
        
        Text("즐겨찾기")
          .background(Color.dark700)
          .tag(Tab.home)
          .tabItem{
            VStack {
              Image("bookmark")
                .renderingMode(.template)
                .imageScale(.large)
              Text("즐겨찾기")
            }
            
          }
        
        Text("설정")
          .background(Color.dark700)
          .tag(Tab.home)
          .tabItem{
            VStack {
              Image("user")
                .renderingMode(.template)
                .imageScale(.large)
              Text("프로필")
            }
            
          }
      }
      .accentColor(.white)
      
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
