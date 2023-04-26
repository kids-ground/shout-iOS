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
