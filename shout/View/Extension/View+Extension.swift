//
//  View+Extension.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI

extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}
