//
//  PostListView.swift
//  shout
//
//  Created by 김록원 on 2023/04/30.
//

import SwiftUI

struct PostListView: View {
  @State var pageIdx = 0
  
  var body: some View {
    VStack(spacing: 0) {
      HStack(alignment: .top, spacing: 24) {
        Button {
          pageIdx = 0
        } label: {
          VStack(spacing: 12) {
            Text("외침")
              .font(.system(size: 18))
              .fontWeight(.bold)
              .foregroundColor(pageIdx == 0 ? .white : Color.dark500)
              
            VStack{}
              .frame(width: 34, height: 2)
              .background(pageIdx == 0 ? .green : .clear)
          }
          .animation(.easeInOut(duration: 0.3), value: pageIdx)
        }
        
        Button {
          pageIdx = 1
        } label: {
          VStack(spacing: 12) {
            Text("명언")
              .font(.system(size: 18))
              .fontWeight(.bold)
              .foregroundColor(pageIdx == 1 ? .white : Color.dark500)
            
            VStack{}
              .frame(width: 34, height: 2)
              .background(pageIdx == 1 ? .green : .clear)
          }
          .animation(.easeInOut(duration: 0.2), value: pageIdx)
        }
      }
      .padding(.horizontal, 24)
      .frame(maxWidth: .infinity, alignment: .leading)
      
      TabView(selection: $pageIdx) {
        ScrollView{
          LazyVStack(spacing: 24){
            ForEach(0..<7) { idx in
              ShoutInteractiveCell()
            }
          }
          .padding(24)
          .padding(.bottom, TabBarView.originalTabBarHeight)
        }
        .tag(0)
        .scrollIndicators(.hidden)
        .refreshable {
          
        }
        
        ScrollView{
          LazyVStack(spacing: 24){
            ForEach(0..<7) { idx in
              WiseSayingInteractiveCell()
            }
          }
          .padding(24)
          .padding(.bottom, TabBarView.originalTabBarHeight)
        }
        .tag(1)
        .scrollIndicators(.hidden)
        .refreshable {
          
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
    }
    .background(Color.dark700)
    .safeAreaInset(edge: .top) {
      NavigationBar(isTransparent: false) {
        HStack(spacing: 8) {
          Text("포스트")
            .font(.system(size: 20))
            .fontWeight(.heavy)
        }
      }
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}


struct ShoutInteractiveCell: View {
  @State var isActive = [false, false]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 12) {
        AsyncImage(url: URL(string:"https://hws.dev/paul.jpg")) { image in
          image.resizable()
            .frame(width: 35, height: 35)
            .scaledToFit()
            .clipShape(Circle())
        } placeholder: {
          VStack{ }.frame(width: 35, height: 35)
        }
        Text("빌게이츠")
          .font(.system(size: 14))
          .fontWeight(.bold)
      }
      Text("세상에 돈보다 중요한게 있다고? 그건 말이 안되는 소리입니다. 여러분, 사탕발림소리에 속지마세요. 돈 머니가 최곱니다 여러분! 저를 보세요 이거리얼입니다! 사탕발림소리에 속지마세요.\n 돈 머니가 최곱니다 여러분! 저를 보세요 이거리얼입니다! 사탕발림소리에 속지마세요. 돈 머니가 최곱니다 여러분! 저를 보세요 이거리얼입니다! ")
        .font(.system(size: 14))
        .multilineTextAlignment(.leading)
        .lineSpacing(4)
        .lineLimit(nil)
      
      Spacer().frame(height: 0.1)
      
      HStack(alignment: .bottom, spacing: 8) {
        ReactionButton(imageName: "heart", isActive: isActive[0], count: 123, activeTint: .pink, inActiveTint: .gray) { isActive in
          self.isActive[0] = isActive
        }
        
        ReactionButton(imageName: "star", isActive: isActive[1], count: 123, activeTint: .yellow, inActiveTint: .gray) { isActive in
          self.isActive[1] = isActive
        }
      }
      .frame(maxWidth: .infinity, alignment: .bottomTrailing)
    }
    .padding(16)
    .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .topLeading)
    .background(Color.dark500)
    .cornerRadius(16)
  }
}


struct WiseSayingInteractiveCell: View {
  @State var isActive = [false, false]
  
  var body: some View {
    VStack(spacing: 12) {
      ZStack(alignment: .center) {
        Color.colors[Int.random(in: 0..<12)]
          .frame(width: 100, height:200)
          .blur(radius: 100)
        VStack(spacing: 24) {
          VStack(alignment: .center, spacing: 12) {
            Image(systemName: "quote.opening")
              .imageScale(.small)
            Text("멈추면 풍경을 만나고 걸으면 추억을 만나며 달리면 꿈을 만난다.\n 풍경을 볼 것인가? 꿈을 향해 달릴 것인가? 선택은 당신의 몫이다. 무엇을 선택하든 당신의 정신과 육체가 한 뜻을 이루길 바란다.")
              .font(.system(size: 15))
              .fontWeight(.semibold)
              .multilineTextAlignment(.center)
              .lineSpacing(8)
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
      
      HStack(alignment: .bottom, spacing: 8) {
        ReactionButton(imageName: "heart", isActive: isActive[0], count: 123, activeTint: .pink, inActiveTint: .gray) { isActive in
          self.isActive[0] = isActive
        }
        
        ReactionButton(imageName: "star", isActive: isActive[1], count: 123, activeTint: .yellow, inActiveTint: .gray) { isActive in
          self.isActive[1] = isActive
        }
      }
      .frame(maxWidth: .infinity, alignment: .trailing)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .padding(.vertical, 24)
    .padding(.horizontal, 16)
    .background(Color.dark500)
    .cornerRadius(16)
  }
}



struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
        .preferredColorScheme(.dark)
    }
}
