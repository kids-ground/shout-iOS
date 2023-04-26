//
//  UIApplication+Extension.swift
//  shout
//
//  Created by 김록원 on 2023/04/26.
//

import UIKit

extension UIApplication {
  static var safeAreaInsets: UIEdgeInsets  {
    let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    return scene?.windows.first?.safeAreaInsets ?? .zero
  }
}
