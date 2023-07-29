//
//  EditInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct EditInjectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var date = Date()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    InjectionSitePickerView()
                    DateTimePickerView(date: $date)
                    InsulinTypePickerView()
                    InsulinUnitPickerView()
                }
                DeleteButtonView()
            }
            .navigationTitle("수정하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("완료")
                    }
                }
            }
        }
    }
}

struct EditInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        EditInjectionView()
    }
}
