//
//  DeleteButtonView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct DeleteButtonView: View {
    @State private var showingAlert = false
    @State private var date = Date()
    @State var injectionSiteNumber: Int32 = 0
//    var injection: Injection
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()

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
                    // TODO: - 삭제 기능 추가
//                    PersistenceController.shared.delete(injection: injection)
                    print("삭제")
                } label: {
                    Text("확인")
                }
            } message: {
                // TODO: - alert 메시지 날짜 값 넣기
                Text("확인을 누르면 xxxx년 x월 x일의 n번 기록을 삭제합니다.")
//                Text("확인을 누르면 \(date, formatter: DeleteButtonView.dateformat)의 \(injectionSiteNumber)번 기록을 삭제합니다.")
            }
        }
    }
}

//struct DeleteButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeleteButtonView()
//    }
//}
