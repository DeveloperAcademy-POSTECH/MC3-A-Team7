//
//  InjectionSitePicker.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/29.
//

import SwiftUI

//struct RectangleTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .padding(10)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
//            .cornerRadius(20)
//    }
//}

struct InjectionSitePickerView: View {
    @Binding var injectionSiteNumber: Int32

    var body: some View {
        HStack {
            Text("주사 부위")
            TextField("-", value: $injectionSiteNumber, format: .number)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
//                .textFieldStyle(RectangleTextFieldStyle())
        }
    }
}
//
//struct InjectionSitePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        InjectionSitePickerView()
//    }
//}
