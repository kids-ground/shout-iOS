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
            Text("나의 각오/외침")
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
            imageName: "brand3D",
            imageColor: .green,
            title: "각오",
            description: "오늘의\n각오 다지기"
          ) {
            viewStore.send(.routeAction(.writeShout))
          }
          
          Spacer().frame(maxWidth: 0)
          
          writeButton(
            imageName: "bulb3D",
            imageColor: .blue,
            title: "외침",
            description: "나만의 외침\n만들기"
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
            .foregroundColor(.clear)
          Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 45)
        }
        .fixedSize()
        
        VStack(alignment: .leading, spacing: 8) {
          Text(title)
            .foregroundColor(.white)
            .font(.system(size: 18))
            .fontWeight(.bold)
          
          Text(description)
            .font(.system(size: 11))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .background(.ultraThinMaterial)
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
