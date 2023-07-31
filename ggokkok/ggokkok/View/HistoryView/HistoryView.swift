//
//  HistoryView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct HistoryView: View {
    @State private var showCreateModal = false
    @State private var showUpdateModal = false

    var body: some View {
        HStack {
            Button {
                self.showCreateModal = true
            } label: {
                Image(systemName: "plus")
            }
            .sheet(isPresented: self.$showCreateModal) {
                CreateInjectionView()
            }

            Button {
                self.showUpdateModal = true
            } label: {
                Text("수정")
            }
            .sheet(isPresented: self.$showUpdateModal) {
                EditInjectionView()
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

