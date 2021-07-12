//
//  ResponseHandler.swift
//  Coupons
//
//  Created by Tal talspektor on 03/02/2021.
//

import Foundation

public enum ResponseHandler {
    
    public static func handle(_ responseItem: NetworkResponseItem) -> Result<Bool, Error> {
        guard responseItem.error == nil else {
            return .failure(responseItem.error!)
        }
        guard let response = responseItem.response as? HTTPURLResponse else {
            return .failure(responseItem.error!)
        }
        
        let result = NetworkResponseHandler.handleNetworkResponse(response)
        switch result {
        case .success:
            return .success(true)
        case .failure(let nenworkFailureError):
            return .failure(nenworkFailureError)
        }
    }
    
    public static func handleWithDecoding<T: Decodable>(_ type: T.Type, _ responseItem: NetworkResponseItem) -> Result<T, Error> {
        guard responseItem.error == nil else {
            debugPrint("\n<<<<< Error: \(responseItem.error!)\n")
            return .failure(responseItem.error!)
        }
        guard let response = responseItem.response as? HTTPURLResponse else {
            debugPrint("\n<<<<< Error: \(responseItem.error!)\n")
            return .failure(responseItem.error!)
        }
        let result = NetworkResponseHandler.handleNetworkResponse(response)
        guard let responseData = responseItem.data else {
            return .failure(EncodingError.nissingData)
        }
        switch result {
        case .success:
            do {
                let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                debugPrint("\n<<<<< Response JSON: \(apiResponse)\n")
                return .success(apiResponse)
            } catch {
                debugPrint(error)
                return .failure(error)
            }
        case .failure(let error):
            do {
                let apiResponse = try JSONDecoder().decode(ResponseErrorModel.self, from: responseData)
                debugPrint("\n<<<<< Response JSON: \(apiResponse) \(error)\n")
                return .failure(HTTPError.httpError(apiResponse))
            } catch {
                debugPrint(error)
                return .failure(error)
            }
        }
    }
}
