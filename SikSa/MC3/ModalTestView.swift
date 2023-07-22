//
//  ModalTestView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

class SelectedData: ObservableObject {
    @Published var selectedIndex: Int = 1
    // @Published var injectDate: [String] = ["2022", "07", "20"]
}

struct ModalTestView: View {
    @StateObject var selectedNum = SelectedData()
    @State private var showUpdateModal = false
    @State private var showCreateModal = false
    
    var body: some View {
        HStack {
            ZStack {
                Button {
                    self.showUpdateModal = true
                } label: {
                    Circle()
                        .fill(Color(hex: "0055B1"))
                        .frame(width: 60, height: 60)
                }
                Text(String(selectedNum.selectedIndex))
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
            }.sheet(isPresented: self.$showUpdateModal) {
                UpdateView(selectedNum: selectedNum)
                    .padding()
            }
            
            Button {
                self.showCreateModal = true
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.blue)
            }.sheet(isPresented: self.$showCreateModal) {
                CreateView()
                    .padding()
            }
            
            
            
        }
        
    }
}

struct ModalTestView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTestView()
    }
}
