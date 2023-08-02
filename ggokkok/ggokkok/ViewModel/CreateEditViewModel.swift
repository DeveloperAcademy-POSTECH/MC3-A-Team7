//
//  CreateEditViewModel.swift
//  GgokKok
//
//  Created by 김수인 on 2023/08/02.
//

import Foundation

final class CreateEditViewModel: ObservableObject {
    @Published var injectionModel: InjectionModel
    @Published var injectionSitePickerString: String = "" {
        willSet {
            injectionModel.site = Int(newValue) ?? 0
        }
    }

    init(injectionModel: InjectionModel) {
        self.injectionModel = injectionModel
    }

    init(injection: Injection) {
        injectionModel = InjectionModel(
            site: injection.wrappedSite,
            insulinType: injection.wrappedInsulinType,
            doses: injection.wrappedDoses,
            timestamp: injection.timestamp
        )
        injectionSitePickerString = injection.wrappedSite.description
    }
}
