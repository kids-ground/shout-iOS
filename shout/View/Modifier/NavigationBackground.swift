//
//  NavigationBackground.swift
//  shout
//
//  Created by 김록원 on 2023/04/26.
//

import SwiftUI

struct NavigationBackground: ViewModifier {
  let isTransparent: Bool
  
  func body(content: Content) -> some View {
    if isTransparent {
      content.background(.ultraThinMaterial)
    } else {
      content.background(Color.dark700)
    }
  }
}

extension View {
  func setNavBarBackground(isTransparent: Bool) -> some View {
    modifier(NavigationBackground(isTransparent: isTransparent))
  }
}
