//
//  ReactionButton.swift
//  shout
//
//  Created by 김록원 on 2023/04/30.
//

import SwiftUI

struct ReactionButton: View {
  let imageName: String
  let isActive: Bool
  let count: Int
  let activeTint: Color
  let inActiveTint: Color
  let onTap: (Bool) -> Void
  
  private let radius: CGFloat = 16
  
  var body: some View {
    VStack {
      HStack(spacing: 20) {
        Button{
          if !isActive {
            HapticManager.shared.impact(style: .soft)
          }
          onTap(!isActive)
        } label: {
          HStack(alignment: .center, spacing: 10) {
            Image(imageName)
              .renderingMode(.template)
              .resizable()
              .scaledToFit()
              .frame(height: 18)
              .foregroundColor(activeTint.opacity(isActive ? 1 : 0.5))
            
            Text("\(count)")
              .font(.system(size:14))
              .foregroundColor(.white)
          }
          .padding(.horizontal, 10)
          .padding(.vertical, 8)
          .overlay{
            RoundedRectangle(cornerRadius: radius)
              .stroke(isActive ? activeTint : inActiveTint, lineWidth: 0.5)
          }
          .background(isActive ? activeTint.opacity(0.25) : Color("ButtonColor"))
          
          .cornerRadius(radius)
        }
        .particleEffect(
          imageName: imageName,
          status: isActive,
          activeTint: activeTint,
          inActiveTint: inActiveTint)
      }
    }
  }
}

struct ReactionButton_Previews: PreviewProvider {
    static var previews: some View {
        ReactionButton(
          imageName: "heart",
          isActive: true,
          count: 123,
          activeTint: .pink,
          inActiveTint: .white,
          onTap: {_ in }
        )
        .preferredColorScheme(.dark)
    }
}
