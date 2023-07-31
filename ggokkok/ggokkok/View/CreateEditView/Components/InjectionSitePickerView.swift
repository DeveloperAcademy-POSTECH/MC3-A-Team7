//
//  InjectionSitePicker.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/29.
//

import SwiftUI

struct InjectionSitePickerView: View {
    @State var injectionSiteNumber: String = ""

    var body: some View {
        HStack {
            Text("주사 부위")
                .padding()
            Spacer()

            ZStack {
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .background(Color("gray200"))
//                    .frame(width: 40, height: 30)
//                    .cornerRadius(10)
//
                TextField("-", text: $injectionSiteNumber)
                    .padding()
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .padding()
        }
    }
}

struct InjectionSitePickerView_Previews: PreviewProvider {
    static var previews: some View {
        InjectionSitePickerView()
    }
}
