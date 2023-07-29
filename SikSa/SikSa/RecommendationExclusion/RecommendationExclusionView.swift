//
//  RecommendationExclusionView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/28.
//

import SwiftUI

struct Duplicate: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}

struct RecommendationExclusionView: View {
    @ObservedObject var recommendationExclusion: RecommendationExclusion
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
                    Picker("추천 제외 부위 선택", selection: $selectedPosition) {
                        ForEach(recommendationExclusion.positions, id: \.self) {
                            Text($0.description)
                        }
                    }
                    .background(Color.mainView7daysBeforeButtonColorUnselected)
                    .pickerStyle(.wheel)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 5, x: 0, y: 4)
                    Button(action: {
                        if recommendationExclusion.exclusionPositions.contains(selectedPosition) {
                            isDuplicated = true
                        } else {
                            recommendationExclusion.addPositionToExclusion(selectedPosition)
                        }
                    }, label: {
                        ZStack {
                            Circle()
                                .shadow(radius: 16, y: 4)
                                .frame(width: 100)
                            Text("추가")
                                .foregroundColor(.white)
                        }
                    })
                    .alert("이미 추천에서 제외된 번호입니다", isPresented: $isDuplicated) {
                        Button("확인", role: .cancel) { }
                    }
                    .padding(.horizontal, 30)
                }
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
                    Button(isEditingMode ? "완료" : "편집") {
                        if isEditingMode {
                            recommendationExclusion.saveUpdatedPositions()
                        }
                        isEditingMode.toggle()
                    }
                }
                if recommendationExclusion.exclusionPositions.isEmpty {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.boxBackgroundColor)
                            .frame(height: 88)
                        Text("추천 제외 부위가 없습니다")
                            .foregroundColor(.gray)
                    }
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(isEditingMode ? recommendationExclusion.newExclusionPositions : recommendationExclusion.exclusionPositions,
                                id: \.self) { position in
                            ExclusionPositionCircle(recommendationExclusion: recommendationExclusion,
                                                    position: position,
                                                    isEditingMode: isEditingMode)
                        }
                    }
                    .padding()
                    .background(Color.boxBackgroundColor)
                    .cornerRadius(10)
                }
            }
        }
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

struct ExclusionPositionCircle: View {
    var recommendationExclusion: RecommendationExclusion
    var position: Int
    var isEditingMode: Bool

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.mainView7daysBeforeButtonColorSelected)
            Text("\(position)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            if isEditingMode {
                Button {
                    recommendationExclusion.removePositionFromExclusion(position)
                } label: {
                    GeometryReader { geometry in
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: geometry.size.width * 0.30)
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width * 0.15,
                                       height: 2.5)
                        }
                    }
                }
            }
        }

    }
}

struct RecommendationExclusionView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationExclusionView(recommendationExclusion: RecommendationExclusion())
    }
}

