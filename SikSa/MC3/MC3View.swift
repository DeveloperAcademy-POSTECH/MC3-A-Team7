//
//  MC3.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/17.
//
import SwiftUI

struct MC3View: View {
    @StateObject private var viewModel = MC3ViewModel()

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
                    Spacer()

                }
                .padding(.horizontal)
                .onAppear {
                    viewModel.tabViewIndicatorDot()
                }

                VStack {
                    Spacer()
                    if viewModel.isToastOnApear {
                        ButtonToastView(viewModel: viewModel)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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
