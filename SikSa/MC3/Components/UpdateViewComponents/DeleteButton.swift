//
//  DeleteButton.swift
//  Ggok-kok
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct DeleteButton: View {
    @State private var showingAlert = false
    var injection: Injection
    @State var selectedDate: Date
    @State var selectedPosition: Int

    var body: some View {
        Button {
            showingAlert = true
        } label: {
            Text("삭제하기")
                .foregroundColor(.red)
                .fontWeight(.semibold)
                .font(.system(size: 17))
        }

        // TODO: - 삭제 버튼 클릭 시 action: 데이터 삭제
        // TODO: - Button message 데이터 가져와서 보여주기
        .alert("이 기록을 삭제하시겠습니까?", isPresented: $showingAlert) {
            Button("취소", role: .cancel) {}
            Button {
                PersistenceController.shared.delete(injection: injection)
            } label: {
                Text("삭제")
            }

        } message: {
            Text("확인을 누르면 \(selectedDate)의 \(selectedPosition)번 기록을 삭제합니다.")
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {

        let injection = Injection()

        DeleteButton(injection: injection, selectedDate: Date(), selectedPosition: 0)
    }
}
