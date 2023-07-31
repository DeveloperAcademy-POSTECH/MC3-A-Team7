//
//  OnboardingView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isFirstLaunching: Bool
    @State var lastNumber: String = ""


    var body: some View {
        let launchingButtonColor: String = lastNumber == "" ? "gray200" : "blue300"

        VStack {
            Spacer()
                .frame(height: 140)

            Text("가지고 있는 주사부위표의")
                .font(.system(size: 22))
                .fontWeight(.semibold)
            HStack {
                Text("마지막 번호")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("blue300"))
                Text("를 입력해 주세요")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
            }
            Spacer()
                .frame(height: 100)

            TextField("마지막 번호", text: $lastNumber)
                .padding()
                .keyboardType(.decimalPad)
                .font(.system(size: 48))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)

            Spacer()
            Button {
                print("시작하기")
                isFirstLaunching.toggle()
            } label: {
                Text("시작하기")
                    .frame(width: 350, height: 54)
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color(launchingButtonColor))
                    .cornerRadius(20)
            }
            .padding()
            .disabled(lastNumber == "")
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
