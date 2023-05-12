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
            HStack {
              Text("오늘 하루,\n나를 위한 각오는?")
                .font(.system(size: 22))
                .lineSpacing(8)
                .fontWeight(.bold)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
              
              Spacer()
              
              Button {
                
              } label : {
                Text("작성하기")
                  .font(.system(size: 14))
                  .fontWeight(.semibold)
              }
              .padding(.vertical, 8)
              .padding(.horizontal, 12)
              .background(.green)
              .cornerRadius(16)
              .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
          } header: {
            Spacer().frame(height: 16)
          } footer: {
            Spacer().frame(height: 16)
          }
          .padding(.horizontal, 24)
          .frame(maxWidth: .infinity, alignment: .leading)
          
          
          Section {
            ButtonSectionView(
              store: store.scope(
                state: \.buttonSectionState,
                action: HomeCore.Action.buttonSectionAction
              )
            )
          } header: {
            Spacer().frame(height: 16)
          } footer: {
            Spacer().frame(height: 60)
          }
          .padding(.horizontal, 24)
          .frame(maxWidth: .infinity, alignment: .center)
          
          Section {
            ShoutSectionView()
          } header: {
            sectionHeader(title: "Hot 외침")
          } footer: {
            Spacer().frame(height: 60)
          }
          .frame(maxWidth: .infinity, alignment: .center)
          
          Section {
            WiseSayingSectionView()
          } header: {
            sectionHeader(title: "Best 명언")
          } footer: {
            Spacer().frame(height: 48)
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
  
  
  func sectionHeader(
    title: String
  ) -> some View {
    HStack(alignment: .center, spacing: 8) {
      Text(title)
        .font(.system(size: 20))
        .fontWeight(.bold)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal, 24)
    .padding(.bottom, 8)
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
