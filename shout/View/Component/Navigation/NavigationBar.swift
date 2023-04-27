//
//  NavigationBar.swift
//  shout
//
//  Created by 김록원 on 2023/04/26.
//

import SwiftUI

struct NavigationBar<Content: View>: View {
  let titleContent: () -> Content
  let isTransparent: Bool
  
  private var topPadding: CGFloat {
    UIApplication.safeAreaInsets.top < 1 ? 8 : 0
  }
  
  init(isTransparent: Bool = false, @ViewBuilder titleContent: @escaping () -> Content) {
    self.isTransparent = isTransparent
    self.titleContent = titleContent
  }
  
  var body: some View {
    VStack {
      titleContent()
    }
    .padding(.leading, 24)
    .padding(.bottom, 12)
    .padding(.top, self.topPadding)
    .frame(maxWidth: .infinity, alignment: .leading)
    .setNavBarBackground(isTransparent: isTransparent)
  }
}

struct NavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBar {
      HStack(spacing: 8) {
        Image("brand")
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(height: 24)
          .foregroundColor(.white)
        Text("외침")
          .font(.system(size: 24))
          .fontWeight(.heavy)
      }
    }
    .preferredColorScheme(.dark)
  }
}
