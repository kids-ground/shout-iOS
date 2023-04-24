//
//  BookmarkView.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI

struct BookmarkView: View {
  var body: some View {
    ScrollView{
      LazyVStack{
        Text("Bookmark")
          .frame(height: 300)
        Text("Bookmark")
          .frame(height: 300)
        Text("Bookmark")
          .frame(height: 300)
        Text("Bookmark")
          .frame(height: 300)
        Text("Bookmark")
          .frame(height: 300)
        Text("Bookmark")
          .frame(height: 300)
      }
    }
  }
}

struct BookmarkView_Previews: PreviewProvider {
  static var previews: some View {
    BookmarkView()
  }
}
