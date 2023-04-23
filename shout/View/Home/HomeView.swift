//
//  HomeView.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      ScrollView{
        LazyVStack{
          Text("Home")
            .frame(height: 300)
          Text("Home")
            .frame(height: 300)
          Text("Home")
            .frame(height: 300)
          Text("Home")
            .frame(height: 300)
          Text("Home")
            .frame(height: 300)
          Text("Home")
            .frame(height: 300)
        }
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
