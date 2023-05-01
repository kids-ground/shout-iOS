//
//  WiseSayingSimpleCell.swift
//  shout
//
//  Created by 김록원 on 2023/04/27.
//

import SwiftUI

struct WiseSayingSimpleCell: View {
  var body: some View {
    VStack {
      ZStack(alignment: .center) {
        Color.colors[Int.random(in: 0..<12)]
          .frame(width: 100, height:200)
          .blur(radius: 100)
        VStack(spacing: 24) {
          VStack(alignment: .center, spacing: 12) {
            Image(systemName: "quote.opening")
              .imageScale(.small)
            Text("멈추면 풍경을 만나고 걸으면 추억을 만나며 달리면 꿈을 만난다.")
              .font(.system(size: 15))
              .fontWeight(.semibold)
              .multilineTextAlignment(.center)
              .lineSpacing(4)
            Image(systemName: "quote.closing")
              .imageScale(.small)
          }
          .frame(maxWidth: .infinity, alignment: .center)
          
          VStack(alignment: .center, spacing: 6) {
            AsyncImage(url: URL(string:"https://hws.dev/paul.jpg")) { image in
              image.resizable()
                .frame(width: 30, height: 30)
                .scaledToFit()
                .clipShape(Circle())
            } placeholder: {
              VStack{ }.frame(width: 30, height: 30)
            }
            Text("Bill Gates")
              .font(.system(size: 12))
              .italic()
          }
        }
      }
      
      Spacer()
      
      HStack(alignment: .bottom, spacing: 16) {
        HStack(alignment: .center, spacing: 4) {
          Image("heart").renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 18)
            .foregroundColor(.pink)
            .opacity(0.3)
          Text("137")
            .font(.system(size: 14))
        }
        
        HStack(alignment: .center, spacing: 4) {
          Image("star").renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 18)
            .foregroundColor(.yellow)
            .opacity(0.3)
          Text("124")
            .font(.system(size: 14))
        }
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
      .padding(.bottom, 16)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .padding(.vertical, 24)
    .padding(.horizontal, 16)
    .background(Color.dark500)
    .cornerRadius(16)
    .padding(.horizontal, 24)
  }
}

struct WiseSayingSimpleCell_Previews: PreviewProvider {
    static var previews: some View {
      WiseSayingSimpleCell()
          .preferredColorScheme(.dark)
          .frame(height: 300)
    }
}
