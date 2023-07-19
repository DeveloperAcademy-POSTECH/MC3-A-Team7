//
//  ModalTestView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

class SelectedNum: ObservableObject {
    @Published var selectedIndex: Int = 1
}

struct ModalTestView: View {
    @StateObject var selectedNum = SelectedNum()
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            Button {
                self.showModal = true
            } label: {
                Circle()
                    .fill(Color(hex: "0055B1"))
                    .frame(width: 60, height: 60)
            }
            Text(String(selectedNum.selectedIndex))
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        }.sheet(isPresented: self.$showModal) {
            UpdateView(selectedNum: selectedNum)
                .padding()
        }
    }
}

struct ModalTestView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTestView()
    }
}
