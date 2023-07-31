//
//  CreateInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct CreateInjectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var date = Date()

    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    InjectionSitePickerView()
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    DateTimePickerView(date: $date)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    InsulinTypePickerView()
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    InsulinDosesPickerView()
                }).listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("생성하기")
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

struct CreateInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateInjectionView()
    }
}

