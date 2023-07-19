//
//  UpdateView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var selectedNum: SelectedNum
    @StateObject private var viewModel = MC3ViewModel()
    
    
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
                    
                    CardView(viewModel: viewModel, selectedNum: selectedNum)
                    
                    Spacer()
                    
                    HStack {
                        Text("날짜 선택")
                            .bold()
                            .padding()
                        Spacer()
                    }
                   
                    
                    Spacer()
                    DatePickerView()
                    DeleteButton()
                }
                .navigationTitle("수정하기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action:
                        {self.presentationMode.wrappedValue.dismiss()})
                        {Text("취소")
                                .foregroundColor(.red)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action:
                                {self.presentationMode.wrappedValue.dismiss()})
                        {Text("완료")}
                    }
                }
            }
        }
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(selectedNum: SelectedNum())
    }
}
