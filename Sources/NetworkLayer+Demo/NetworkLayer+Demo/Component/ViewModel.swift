//
//  ViewModel.swift
//  NetworkLayer+Demo
//
//  Created by Tal talspektor on 18/08/2021.
//

import Foundation

class ViewModel {
    
    let dataProvoder: TeamsDataProvider
    
    init(dataProvoder: TeamsDataProvider) {
        self.dataProvoder = dataProvoder
    }
    
    func fetchSpanishLegue() {
        dataProvoder.fetchSpanishLegue { result in
            switch result {
            case .success(let teams):
                print(teams)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchFrenchLegue() {
        dataProvoder.fetchFrenchLegue { result in
            switch result {
            case .success(let teams):
                print(teams)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchEnglishLegue() {
        dataProvoder.fetchEnglishLegue { result in
            switch result {
            case .success(let teams):
                print(teams)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
