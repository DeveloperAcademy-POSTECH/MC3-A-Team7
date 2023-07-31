//
//  InsulinDosesPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinDosesPickerView: View {
    @State private var insulinDoses = 1

    var body: some View {
        VStack {
            HStack {
                Text("인슐린 단위")
                Spacer()
            }
            Stepper(value: $insulinDoses, in: 1...10) {
                Text("\(insulinDoses) 단위")
            }
            .padding()
            .background(Color("blue100"))
            .cornerRadius(10)
        }
    }
}

struct InsulinDosesPickerView_Previews: PreviewProvider {
    static var previews: some View {
        InsulinDosesPickerView()
    }
}
