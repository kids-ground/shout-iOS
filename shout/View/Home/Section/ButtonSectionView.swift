//
//  ButtonSectionView.swift
//  shout
//
//  Created by 김록원 on 2023/04/27.
//

import SwiftUI
import ComposableArchitecture

struct ButtonSectionView: View {
  let store: StoreOf<ButtonSectionCore>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack(spacing: 8) {
        Button {
          viewStore.send(.routeAction(.myShout))
        } label: {
          HStack {
            Text("나의 외침/명언")
              .font(.system(size: 18))
              .fontWeight(.bold)
            Spacer()
            Image(systemName:  "chevron.right")
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.vertical, 20)
          .padding(.horizontal, 16)
          .background(.ultraThinMaterial)
          .cornerRadius(16)
          .foregroundColor(.white)
        }
        
        HStack{}.frame(height: 0)
        
        HStack(alignment: .top, spacing: 8) {
          writeButton(
            imageName: "brand",
            imageColor: .green,
            title: "외침",
            description: "그때, 하지\n못했던 이야기"
          ) {
            viewStore.send(.routeAction(.writeShout))
          }
          
          Spacer().frame(maxWidth: 0)
          
          writeButton(
            imageName: "bulb",
            imageColor: .blue,
            title: "명언",
            description: "당신의\n인생철학은?"
          ) {
            viewStore.send(.routeAction(.writeWiseSaying))
          }
        }
      }
    }
  }
  
  func writeButton(
    imageName: String,
    imageColor: Color,
    title: String,
    description: String,
    action: @escaping () -> Void
  ) -> some View {
    Button{
      action()
    } label: {
      HStack(spacing: 16) {
        ZStack(alignment: .center) {
          Circle().frame(width: 50)
            .foregroundColor(.white)
          Image(imageName)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(height: 30)
            .foregroundColor(imageColor)
        }
        .fixedSize()
        
        VStack(alignment: .leading, spacing: 6) {
          Text(title)
            .foregroundColor(.white)
            .font(.system(size: 18))
            .fontWeight(.bold)
          
          Text(description)
            .font(.system(size: 12))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
        }
      }
      .frame(alignment: .leading)
      .padding(0)
      .padding(.vertical, 16)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .background(imageColor)
    .cornerRadius(16)
  }
}

struct ButtonSectionView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonSectionView(
      store: Store(
        initialState: ButtonSectionCore.State(),
        reducer: ButtonSectionCore()
      )
    )
      .preferredColorScheme(.dark)
      .scaledToFit()
  }
}
