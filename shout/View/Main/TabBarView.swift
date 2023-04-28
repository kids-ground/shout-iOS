//
//  TabBarView.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
  let store: StoreOf<TabBarCore>
  
  init(store: StoreOf<TabBarCore>) {
    self.store = store
    
  }
  
  static var originalTabBarHeight: CGFloat {
    UIApplication.safeAreaInsets.bottom < 10 ? 60 : 50
  }
  
  private var tabBarHeight: CGFloat {
    UIApplication.safeAreaInsets.bottom < 10 ?
      60 : UIApplication.safeAreaInsets.bottom + 50
  }
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      HStack(alignment: .top) {
        ForEach(TabBarItem.allCases, id: \.self) { tag in
          self.tabBarButton(
            tag: tag,
            viewStore: viewStore
          )
        }
      }
      .padding(.horizontal, 24)
      .padding(.vertical, 8)
      .frame(maxWidth: .infinity, maxHeight: self.tabBarHeight, alignment: .top)
      .background(.ultraThinMaterial)
      .cornerRadius(16, corners: [.topLeft, .topRight])
    }
  }
  
  func tabBarButton(
    tag: TabBarItem,
    viewStore: ViewStore<TabBarCore.State, TabBarCore.Action>
  ) -> some View {
    Button {
      if viewStore.selectedTab != tag {
        viewStore.send(.selectedTabChange(tag))
      }
    } label: {
      VStack {
        Image(tag.imageName)
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(height: 28)
          .animation(.easeOut(duration: 0.2), value: viewStore.selectedTab)
        Text(tag.title)
          .font(.system(size: 12))
      }
      .frame(maxWidth: .infinity)
      .foregroundColor(viewStore.selectedTab == tag ? .white : .gray.opacity(0.5))
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView(store: Store(initialState: TabBarCore.State(), reducer: TabBarCore()))
    }
}
