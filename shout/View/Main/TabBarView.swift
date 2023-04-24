//
//  TabBarView.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI

struct TabBarView: View {
  
  var body: some View {
    HStack(alignment: .top) {
      TabBarButton(title: "홈", imageName: "home")
      TabBarButton(title: "저장", imageName: "bookmark")
      TabBarButton(title: "설정", imageName: "user")
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity, maxHeight: 85, alignment: .top)
    .background(.ultraThinMaterial)
    .cornerRadius(16, corners: [.topLeft, .topRight])
  }
}

struct TabBarButton: View {
  var title: String
  var imageName: String
  
  
  var body: some View {
    Button {
      
    } label: {
      VStack {
        Image(imageName)
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(height: 28)
        Text(title)
          .font(.system(size: 10))
      }
      .frame(maxWidth: .infinity)
      .foregroundColor(.white)
    }
  }
  
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
