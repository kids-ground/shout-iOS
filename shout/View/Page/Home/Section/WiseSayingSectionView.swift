//
//  WiseSayingSectionView.swift
//  shout
//
//  Created by 김록원 on 2023/04/27.
//

import SwiftUI

struct WiseSayingSectionView: View {
    var body: some View {
      TabView {
        ForEach(0..<5) { data in
          WiseSayingSimpleCell()
        }
      }
      .tabViewStyle(.page)
      .indexViewStyle(.page(backgroundDisplayMode: .interactive))
      .frame(maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
    }
}

struct WiseSayingSectionView_Previews: PreviewProvider {
    static var previews: some View {
        WiseSayingSectionView()
    }
}
