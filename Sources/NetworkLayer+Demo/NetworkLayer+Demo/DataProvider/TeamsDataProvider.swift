//
//  TeamsDataProvider.swift
//  NetworkLayer+Demo
//
//  Created by Tal talspektor on 18/08/2021.
//

import Foundation
import NetworkLayer

protocol TeamsDataProvider {
    func fetchSpanishLegue(completion: @escaping (Result<TeamsResult , Error>) -> Void)
    func fetchEnglishLegue(completion: @escaping (Result<TeamsResult , Error>) -> Void)
    func fetchFrenchLegue(completion: @escaping (Result<TeamsResult , Error>) -> Void)
}

class NetworkTeamsDataProvider: TeamsDataProvider {
    
    private let router: Router<TeamsEndPoint>
    
    init(router: Router<TeamsEndPoint>) {
        self.router = router
    }
    
    func fetchSpanishLegue(completion: @escaping (Result<TeamsResult , Error>) -> Void) {
        router.request(.spain) { responseItem in
            ResponseHandler.handleWithDecoding(TeamsResult.self, responseItem) { result in
                completion(result)
            }
        }
    }
    
    func fetchEnglishLegue(completion: @escaping (Result<TeamsResult , Error>) -> Void) {
        router.request(.england) { responseItem in
            ResponseHandler.handleWithDecoding(TeamsResult.self, responseItem) { result in
                completion(result)
            }
        }
    }
    
    func fetchFrenchLegue(completion: @escaping (Result<TeamsResult , Error>) -> Void) {
        router.request(.france) { responseItem in
            ResponseHandler.handleWithDecoding(TeamsResult.self, responseItem) { result in
                completion(result)
            }
        }
    }
}
