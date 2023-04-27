//
//  ShoutSimpleCell.swift
//  shout
//
//  Created by 김록원 on 2023/04/27.
//

import SwiftUI

struct ShoutSimpleCell: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 12) {
        AsyncImage(url: URL(string:"https://hws.dev/paul.jpg")) { image in
          image.resizable()
            .frame(width: 30, height: 30)
            .scaledToFit()
            .clipShape(Circle())
        } placeholder: {
          VStack{ }.frame(width: 30, height: 30)
        }
        Text("빌게이츠")
          .font(.system(size: 14))
          .fontWeight(.bold)
      }
      Text("세상에 돈보다 중요한게 있다고? 그건 말이 안되는 소리입니다. 여러분, 사탕발림소리에 속지마세요. 돈 머니가 최곱니다 여러분! 저를 보세요 이거리얼입니다!")
        .font(.system(size: 12))
        .multilineTextAlignment(.leading)
        .lineSpacing(4)
        .lineLimit(nil)
      
      Spacer().frame(height: 0.1)
      
      HStack(alignment: .bottom, spacing: 16) {
        HStack(alignment: .center, spacing: 4) {
          Image("heart").renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 18)
            .foregroundColor(.pink)
          
          Text("137")
            .font(.system(size: 14))
        }
        
        HStack(alignment: .center, spacing: 4) {
          Image("star").renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 18)
            .foregroundColor(.yellow)
          Text("124")
            .font(.system(size: 14))
        }
      }
      .frame(maxWidth: .infinity, alignment: .bottomTrailing)
      
    }
    .padding(16)
    .frame(maxWidth: 200, minHeight: 180, alignment: .topLeading)
    .background(Color.dark500)
    .cornerRadius(16)
  }
}

struct ShoutSimpleCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoutSimpleCell()
    }
}
