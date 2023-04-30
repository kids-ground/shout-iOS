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
          LazyVStack{
            ForEach(0..<7) { idx in
              Text("Shout \(idx)")
                .frame(height: 300)
            }
          }
        }
        .tag(0)
        .scrollIndicators(.hidden)
        
        ScrollView{
          LazyVStack{
            ForEach(0..<7) { idx in
              Text("WiseSaying \(idx)")
                .frame(height: 300)
            }
          }
        }
        .tag(1)
        .scrollIndicators(.hidden)
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
  }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
        .preferredColorScheme(.dark)
    }
}
