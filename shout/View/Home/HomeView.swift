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
                description: "그때, 하지 못했던 이야기"
              ) {
                
              }
              
              Spacer().frame(maxWidth: 0)
              
              writeButton(
                imageName: "star",
                imageColor: .yellow,
                title: "명언",
                description: "당신의 인생철학은?"
              ) {
                
              }
            }
          } header: {
            VStack{}.frame(height: 16)
          }
          .padding(.horizontal, 24)
          .frame(maxWidth: .infinity, alignment: .center)
          
          ForEach(0..<10) {_ in
            Text("Hello World")
              .frame(height: 300)
              .listRowSeparator(.hidden)
              .listRowInsets(.none)
              .listRowBackground(Color.dark700)
          }
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
