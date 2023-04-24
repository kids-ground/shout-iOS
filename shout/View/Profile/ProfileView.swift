//
//  ProfileView.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    ScrollView{
      LazyVStack{
        Text("Profile")
          .frame(height: 300)
        Text("Profile")
          .frame(height: 300)
        Text("Profile")
          .frame(height: 300)
        Text("Profile")
          .frame(height: 300)
        Text("Profile")
          .frame(height: 300)
        Text("Profile")
          .frame(height: 300)
      }
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
