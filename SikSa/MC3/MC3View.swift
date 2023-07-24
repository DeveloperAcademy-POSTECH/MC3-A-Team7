//
//  MC3.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/17.
//
import SwiftUI

struct MC3View: View {
    @StateObject private var viewModel = MC3ViewModel()
    @State private var showModal = false

    var body: some View {
        NavigationView {

            ZStack {
                VStack(alignment: .center, spacing: 32) {
                    TopMainTextView(viewModel: viewModel)
                    VStack(spacing: 12) {
                        TabViewComponentsView(viewModel: viewModel)
                        BottomTextLineView(viewModel: viewModel)
                    }
                    ButtonComponentView(viewModel: viewModel)

                }
                .padding(.horizontal)
                .onAppear {
                    viewModel.tabViewIndicatorDot()
                }
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("RefreshMainView"))) { _ in
                    self.viewModel.injectionsByPositionArray = MC3ViewModel.buildInjectionsByPositionArray()
                }
                .alert("이 부위는 투여후 일주일이 지나지 않았습니다.", isPresented: $viewModel.under7DaysButtonActivate) {
                    Button("취소", role: .cancel) {}
                    Button("기록") {
                        viewModel.buttonActionForRecord()
                }}
                message: {
                    Text("기록을 누르면 마지막 투여일이 재기록됩니다.")
                }
                VStack {

                    if viewModel.isToastOnApear,
                       let currentInjection = viewModel.lastUpdatedInjection {
                        Spacer()
                        ButtonToastView(viewModel: viewModel, injection: currentInjection)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    viewModel.isToastOnApear.toggle()
                                }
                            }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        HistoryView()
                    } label: {
                        Label("주사기록", systemImage: "archivebox")
                    }
                }
            }
        }
    }
}

struct MC3View_Previews: PreviewProvider {
    static var previews: some View {
        MC3View()
    }
}
