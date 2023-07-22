//
//  CreateView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/20.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = MC3ViewModel()
    @State var createNumber: Int = 0
//    @Binding var selectedIndex: Int?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("부위 선택")
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    CreateCardView(viewModel: viewModel)
                    
                    Spacer()
                    
                    HStack {
                        Text("날짜 선택")
                            .bold()
                            .padding()
                        Spacer()
                    }
                   
                    DatePickerView()
                }
                .navigationTitle("생성하기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {self.presentationMode.wrappedValue.dismiss()})
                        {Text("취소")
                                .foregroundColor(.red)
                        }
                    }
                    // TODO: - 추가 버튼 클릭 시 새로운 데이터 추가
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {self.presentationMode.wrappedValue.dismiss()})
                        {Text("추가")}   
                    }
                }
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
