//
//  InjectionSitePicker.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/29.
//

import SwiftUI

struct InjectionSitePickerView: View {
    @Binding var siteString: String

    var body: some View {
        HStack {
            Text("주사 부위")
            TextField("-", text: $siteString)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
        }
    }
}
