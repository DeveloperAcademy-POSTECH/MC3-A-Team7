//
//  RecommendationExclusionView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/28.
//

import SwiftUI

struct RecommendationExclusionView: View {
    @ObservedObject var viewModel: RecommendationExclusionViewModel
    @Environment(\.dismiss) private var dismiss
    @State var selectedPosition = 1
    @State var isEditingMode = false
    @State var isDuplicated = false
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("추천에서 제외할 부위")
                    Spacer()
                }
                HStack(spacing: 20) {
                    Picker("부위 선택", selection: $selectedPosition) {
                        ForEach(viewModel.positions, id: \.self) {
                            Text($0.description)
                        }
                    }
                    .background(Color.blue100)
                    .pickerStyle(.wheel)
                    .cornerRadius(15)
                    .shadow(color: .black100.opacity(0.25), radius: 5, x: 0, y: 4)
                    Button(action: {
                        if viewModel.newExclusionPositions.contains(selectedPosition) {
                            isDuplicated = true
                        } else {
                            viewModel.addPositionToExclusion(selectedPosition)
                        }
                    }, label: {
                        ZStack {
                            Circle()
                                .shadow(color: .black100.opacity(0.25), radius: 16, y: 4)
                                .frame(width: 100)
                            Text("추가")
                                .foregroundColor(.white)
                        }
                    })
                    .alert("이미 추천에서 제외된 번호입니다", isPresented: $isDuplicated) {
                        Button("확인", role: .cancel) { }
                    }
                }
                .padding(.horizontal, 30)
            }
            .font(.title2)
            .bold()
            .padding(.vertical)
            VStack {
                HStack {
                    Text("추천에서 제외된 부위")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button(isEditingMode ? "저장" : "편집") {
                        if isEditingMode {
                            viewModel.saveUpdatedPositions()
                        }
                        isEditingMode.toggle()
                    }
                }
                if viewModel.exclusionPositions.isEmpty || viewModel.newExclusionPositions.isEmpty {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.blue100)
                            .frame(height: 110)
                        Text("추천 제외 부위가 없습니다")
                            .foregroundColor(.gray)
                    }
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(isEditingMode ? viewModel.newExclusionPositions : viewModel.exclusionPositions,
                                id: \.self) { position in
                            ExclusionPositionCircle(viewModel: viewModel,
                                                    position: position,
                                                    isEditingMode: isEditingMode)
                        }
                    }
                    .padding()
                    .background(Color.blue100)
                    .cornerRadius(10)
                }
            }
        }
        .onTapGesture(perform: {
            if isEditingMode {
                viewModel.saveUpdatedPositions()
                isEditingMode = false
            }
        })
        .padding()
        .navigationBarBackButtonHidden()
        .navigationTitle("추천 제외 부위")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("뒤로가기", systemImage: "chevron.backward")
                }
            }
        }
    }
}


struct RecommendationExclusionView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationExclusionView(viewModel: RecommendationExclusionViewModel())
    }
}