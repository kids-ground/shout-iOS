//
//  ProfileView.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    
    List {
      HStack(spacing: 16) {
        AsyncImage(url: URL(string:"https://hws.dev/paul.jpg")) { image in
          image.resizable()
            .frame(width: 50, height: 50)
            .scaledToFit()
            .clipShape(Circle())
        } placeholder: {
          VStack{ }.frame(width: 50, height: 50)
        }
        Text("빌게이츠")
          .font(.system(size: 16))
          .fontWeight(.semibold)
        
        Spacer()
        
        Image(systemName:  "chevron.right")
      }
      .listRowBackground(Color.dark500)
      .padding(.vertical, 4)
      
      Section {
        Text("차단유저 관리")
          .listRowBackground(Color.dark500)
        Text("내 외침/명언 관리")
          .listRowBackground(Color.dark500)
      } header: {
        Text("관리")
          .foregroundColor(.white)
      }
      
      Section {
        Text("알림설정")
          .listRowBackground(Color.dark500)
        Text("개발자 밥주기")
          .listRowBackground(Color.dark500)
      } header: {
        Text("일반")
          .foregroundColor(.white)
      }
      
      Section {
        Text("고객센터")
          .listRowBackground(Color.dark500)
        Text("개인정보 처리방침")
          .listRowBackground(Color.dark500)
        Text("서비스 이용약관")
          .listRowBackground(Color.dark500)
        Text("현재 버전")
          .listRowBackground(Color.dark500)
        Text("로그아웃")
          .listRowBackground(Color.dark500)
        Text("회원탈퇴")
          .listRowBackground(Color.dark500)
      } header: {
        Text("정보")
          .foregroundColor(.white)
      }

    }
    .listStyle(.insetGrouped)
    .scrollContentBackground(.hidden)
    .padding(.horizontal, 4)
    .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
    .safeAreaInset(edge: .top) {
      NavigationBar(isTransparent: false) {
        HStack(spacing: 8) {
          Text("설정")
            .font(.system(size: 20))
            .fontWeight(.heavy)
        }
      }
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .preferredColorScheme(.dark)
      .background(Color.dark700)
  }
}
