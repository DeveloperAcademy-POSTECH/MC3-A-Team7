//
//  OnboardingView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI


struct OnboardingView: View {
    @Binding var isFirstLaunching: Bool
    let userInfo = UserInfo.shared
    @FocusState private var isFocused: Bool
    @State var lastSite = ""

    init(isFirstLaunching: Binding<Bool>) {
        self._isFirstLaunching = isFirstLaunching
        _lastSite = State(initialValue: userInfo.lastSiteNumber == 0 ? "" : userInfo.lastSiteNumber.description)
    }

    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    header(height: geometry.size.height * 0.30)
                    Spacer()
                    textField
                }
                .frame(height: geometry.size.height * 0.60)
            }
            Spacer()
            button
        }
        .font(.title2)
        .fontWeight(.semibold)
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = false
        }
        .onAppear {
            lastSite = userInfo.lastSiteNumber == 0 ? "" : userInfo.lastSiteNumber.description
        }
    }

    func header(height: CGFloat?) -> some View {
        return VStack {
            Spacer()
            Text("가지고 있는 주사부위표의")
            HStack(spacing: 0) {
                Text("마지막 번호")
                    .foregroundColor(.blue300)
                Text("를 입력해 주세요")
            }
        }.frame(height: height)
    }

    var textField: some View {
        TextField("마지막 번호", text: $lastSite)
            .font(.system(size: 48))
            .foregroundColor(.black100)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
            .focused($isFocused)
    }

    var button: some View {
        Button {
            userInfo.lastSiteNumber = Int(lastSite) ?? 31
            isFocused = false
            if isFirstLaunching {
                isFirstLaunching = false
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 54)
                Text(isFirstLaunching ? "시작하기" : "저장하기")
                    .foregroundColor(.white)
            }
            .padding(.vertical)
        }
        .disabled(lastSite == "")
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}




