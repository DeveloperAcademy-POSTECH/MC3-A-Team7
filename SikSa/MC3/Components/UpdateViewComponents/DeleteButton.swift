//
//  DeleteButton.swift
//  Ggok-kok
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct DeleteButton: View {
    @State private var showingAlert = false
    
    var body: some View {
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
            Button("삭제") { print("삭제 버튼 클릭됨.") }        } message: {
            Text("확인을 누르면 2023년 7월 13일의 2번 기록을 삭제합니다.")
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton()
    }
}

