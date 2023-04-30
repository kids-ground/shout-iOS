//
//  ProfileView.swift
//  shout
//
//  Created by 김록원 on 2023/04/24.
//

import SwiftUI

struct ProfileView: View {
  @State var toggle = true
  
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
        listRowView(imageName: "star", title: "저장한 외침/명언")
        listRowView(imageName: "myPost", title: "내 외침/명언")
        listRowView(imageName: "userBlock", title: "차단유저")
      } header: {
        Text("관리")
          .foregroundColor(.white)
      }
      
      Section {
        listRowView(imageName: "bell", title: "알림설정") {
          Toggle("", isOn: $toggle)
        }
        listRowView(imageName: "bone", title: "개발자 밥주기")
      } header: {
        Text("일반")
          .foregroundColor(.white)
      }
      
      Section {
        listRowView(imageName: "call", title: "고객센터")
        listRowView(imageName: "key", title: "개인정보 처리방침")
        listRowView(imageName: "shield", title: "서비스 이용약관")
        listRowView(imageName: "info", title: "현재 버전") {
          Text("v1.0.0")
            .foregroundColor(.gray)
            .font(.system(size: 12))
        }
        listRowView(imageName: "userLogout", title: "로그아웃") { }
        listRowView(imageName: "power", title: "회원탈퇴") { }
      } header: {
        Text("정보")
          .foregroundColor(.white)
      }

    }
    .listStyle(.insetGrouped)
    .scrollContentBackground(.hidden)
    .scrollIndicators(.hidden)
    .padding(.horizontal, 8)
    .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
    .safeAreaInset(edge: .top) {
      NavigationBar(isTransparent: false) {
        HStack(spacing: 8) {
          Text("프로필")
            .font(.system(size: 20))
            .fontWeight(.heavy)
        }
      }
    }
  }
  
  func listRowView<Content: View>(
    imageName: String = "",
    title: String,
    @ViewBuilder rightItem: () -> Content = {
      Image(systemName:  "chevron.right")
        .renderingMode(.template)
        .resizable()
        .scaledToFit()
        .frame(height: 8)
        .foregroundColor(.gray)
    }
  ) -> some View {
    HStack(spacing: 0){
      HStack(spacing: 16) {
        if !imageName.isEmpty {
          Image(imageName)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 18)
        }
        
        Text(title)
          .font(.system(size: 14))
      }
      .foregroundColor(.white)
      
      Spacer()
      rightItem()
    }
    
    .listRowBackground(Color.dark500)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .preferredColorScheme(.dark)
      .background(Color.dark700)
  }
}
