//
//  DataDummyView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/19.
//

import SwiftUI

struct DataDummyView: View {
    var body: some View {
        let injectionsArray = PersistenceController.shared.injectionsByPositionArray
     
        HStack {
            ForEach(injectionsArray.indices, id: \.self ) { index in
                
                Text(injectionsArray[index])
            }
        }
    }
}

struct DataDummyView_Previews: PreviewProvider {
    static var previews: some View {
        DataDummyView()
    }
}
