//
//  DeleteButtonView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct DeleteButtonView: View {
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(.white)
                .frame(width: 350, height: 54)
                .cornerRadius(20)

            Button {
                showingAlert = true
            } label: {
                Text("삭제하기")
                    .foregroundColor(.red)
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
            }
            .alert("이 기록을 삭제하시겠습니까?", isPresented: $showingAlert) {
                Button("취소", role: .cancel) {}
                Button {
                    print("삭제")
                } label: {
                    Text("확인")
                }
            } message: {
                Text("확인을 누르면 xxxx년 x월 x일의 n번 기록을 삭제합니다.")
            }
        }
    }
}

struct DeleteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButtonView()
    }
}

