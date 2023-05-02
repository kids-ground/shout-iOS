//
//  LoginView.swift
//  shout
//
//  Created by 김록원 on 2023/05/02.
//

import SwiftUI

struct LoginView: View {
  var body: some View {
    VStack(alignment: .center) {
      VStack(spacing: 8) {
        Text("오늘을 향한 외침,")
          .multilineTextAlignment(.leading)
          .lineLimit(nil)
          .font(.system(size: 24))
          .fontWeight(.bold)
        Text("내일을 위한 명언.")
          .multilineTextAlignment(.leading)
          .lineLimit(nil)
          .font(.system(size: 24))
          .fontWeight(.bold)
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 24)
      .padding(.top, 36)
      
      HStack(spacing: 24) {
        VStack {
          Image("brand3D")
            .resizable()
            .scaledToFit()
          VStack{}.frame(height: 60)
        }
        
        VStack {
          VStack{}.frame(height: 60)
          Image("bulb3D")
            .resizable()
            .scaledToFit()
        }
      }
      .frame(maxHeight: .infinity)
      .padding(.horizontal, 24)
      
      VStack(alignment: .center, spacing: 16) {
        socialLoginButton(
          socialImage: "kakaoLogo",
          title: "카카오톡으로 계속하기",
          backgroundColor: .kakaoYellow,
          fontColor: .kakaoBrown
        ) {
          
        }
        socialLoginButton(
          socialImage: "appleLogo",
          title: "Apple로 계속하기",
          backgroundColor: .white,
          fontColor: .black
        ) {
          
        }
      }
      .padding(.bottom, 36)
    }
    .background(Color.dark700)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
  }
  
  func socialLoginButton(
    socialImage: String,
    title: String,
    backgroundColor: Color,
    fontColor: Color,
    action: @escaping () -> Void
  ) -> some View {
    Button {
      action()
    } label: {
      HStack(alignment: .center) {
        Image(socialImage)
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)
          .foregroundColor(fontColor)
          
        HStack(alignment: .center) {
          Text(title)
            .foregroundColor(.black)
            .font(.system(size: 15))
            .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        VStack{}.frame(width: 24)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 14)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(backgroundColor)
    .cornerRadius(16)
    .padding(.horizontal, 24)
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
    .preferredColorScheme(.dark)
    .background(Color.dark700)
  }
}
