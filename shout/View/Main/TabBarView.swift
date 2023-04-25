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
      .frame(maxWidth: .infinity, maxHeight: 85, alignment: .top)
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
        Text(tag.title)
          .font(.system(size: 10))
      }
      .frame(maxWidth: .infinity)
      .foregroundColor(viewStore.selectedTab == tag ? .white : .dark700)
    }
  }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView(store: Store(initialState: TabBarCore.State(), reducer: TabBarCore()))
    }
}
