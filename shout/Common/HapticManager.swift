//
//  HapticManager.swift
//  shout
//
//  Created by 김록원 on 2023/05/02.
//

import SwiftUI

class HapticManager {
  static let shared = HapticManager()
  private init() {}
  
  func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(type)
  }
  
  func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
  }
}
