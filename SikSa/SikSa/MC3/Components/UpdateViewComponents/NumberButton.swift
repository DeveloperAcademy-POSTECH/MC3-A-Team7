//
//  NumberButton.swift
//  Ggok-kok
//
//  Created by 김수인 on 2023/07/17.
//

import SwiftUI

struct NumberButton: View {
    @StateObject var viewModel: MC3ViewModel
    var index: Int
    
    var body: some View {
        ZStack {
            Button {
                print("Number Button Clicked")
            } label: {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 57, height: 57)
            }
            Text("1")
                .font(.system(size: 20))
                .bold()
        }
        
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(viewModel: viewModel, index: 0)
    }
}
