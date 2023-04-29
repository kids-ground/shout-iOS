//
//  ShoutSectionView.swift
//  shout
//
//  Created by 김록원 on 2023/04/27.
//

import SwiftUI

struct ShoutSectionView: View {
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: 16) {
          ForEach(0..<5) { data in
            ShoutSimpleCell()
          }
        }
        .padding(.horizontal, 24)
      }
    }
}

struct ShoutSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ShoutSectionView()
    }
}
