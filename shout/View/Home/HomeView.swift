//
//  HomeView.swift
//  shout
//
//  Created by 김록원 on 2023/04/23.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
  let store: StoreOf<HomeCore>
  let mainListName = "HomeViewMainList"
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      ScrollView {
        LazyVStack {
          Section {
            HStack(alignment: .top, spacing: 8) {
              writeButton(
                imageName: "heart",
                imageColor: .pink,
                title: "외침",
                description: "그때, 하지\n못했던 이야기"
              ) { }
              
              Spacer().frame(maxWidth: 0)
              
              writeButton(
                imageName: "star",
                imageColor: .yellow,
                title: "명언",
                description: "당신의\n인생철학은?"
              ) { }
            }
          } header: {
            VStack{}.frame(height: 16)
          } footer: {
            VStack{}.frame(height: 32)
          }
          .padding(.horizontal, 24)
          .frame(maxWidth: .infinity, alignment: .center)
          
          Section {
            ScrollView(.horizontal, showsIndicators: false) {
              LazyHStack(spacing: 16) {
                ForEach(0..<10) { data in
                  
                  
                  VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                      AsyncImage(url: URL(string:"https://hws.dev/paul.jpg")) { image in
                        image.resizable()
                          .frame(width: 40, height: 40)
                          .scaledToFit()
                          .clipShape(Circle())
                      } placeholder: {
                        VStack{ }.frame(width: 40, height: 40)
                      }
                      Text("빌게이츠")
                        .fontWeight(.bold)
                    }
                    Text("세상에 돈보다 중요한게 있다고? 그건 말이 안되는 소리입니다. 여러분, 사탕발림소리에 속지마세요")
                      .font(.system(size: 16))
                      .multilineTextAlignment(.leading)
                      
                      .lineLimit(nil)
                      .lineSpacing(6)
                    
                    Spacer()
                    Divider()
                    
                    HStack(alignment: .top, spacing: 16) {
                      HStack(alignment: .center, spacing: 4) {
                        Image("heart").renderingMode(.template)
                          .foregroundColor(.pink)
                        Text("137")
                      }
                      
                      HStack(alignment: .center, spacing: 4) {
                        Image("star").renderingMode(.template)
                          .foregroundColor(.yellow)
                        Text("124")
                      }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                  }
                  .padding(16)
                  .frame(maxWidth: 250, minHeight: 250, alignment: .topLeading)
                  .background(Color.dark500)
                  .cornerRadius(16)
                  
                  
                }
              }
              .padding(.horizontal, 24)
            }
          } header: {
            HStack{
              Text("🔥 Hot 외침")
                .font(.system(size: 22))
                .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 24)
          } footer: {
            VStack{}.frame(height: 32)
          }
          .frame(maxWidth: .infinity, alignment: .center)
          
          
        }
        .background(GeometryReader { proxy in
          Color.clear
            .preference(
              key: ScrollOffsetKey.self,
              value: -proxy.frame(in: .named(mainListName)).origin.y
            )
          }
        )
      }
      .listStyle(.plain)
      .scrollContentBackground(.hidden)
      .coordinateSpace(name: mainListName)
      .onPreferenceChange(ScrollOffsetKey.self) { offsetY in
        viewStore.send(.mainListScrolled(offsetY))
      }
      .safeAreaInset(edge: .top) {
        NavigationBar(isTransparent: viewStore.isHeaderTransParent) {
          HStack(spacing: 8) {
            Image("brand")
              .renderingMode(.template)
              .resizable()
              .scaledToFit()
              .frame(height: 20)
              .foregroundColor(.white)
            Text("외침")
              .font(.system(size: 20))
              .fontWeight(.heavy)
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
      VStack(spacing: 16) {
        ZStack(alignment: .center) {
          Circle().frame(width: 55)
            .foregroundColor(imageColor)
          Image(imageName)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(height: 35)
            .foregroundColor(.white)
        }
        .fixedSize()
        
        Text(title)
          .foregroundColor(.white)
          .font(.system(size: 20))
          .fontWeight(.bold)
        
        Text(description)
          .font(.system(size: 16))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
      }
      .padding(20)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .background(Color.dark500)
    .cornerRadius(16)
  }
}


// MARK: Scroll Event
fileprivate struct ScrollOffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}


// MARK: Preview
struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(store: Store(
      initialState: HomeCore.State(),
      reducer: HomeCore()
    ))
      .preferredColorScheme(.dark)
      .background(Color.dark700)
  }
}
