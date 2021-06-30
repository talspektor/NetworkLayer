//
//  APICaller.swift
//  InteractiveDemo
//
//  Created by Tal Spektor on 27/06/2021.
//

import Foundation

struct NetworkResponse {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}

struct APICaller {
    static func makeDataTask<T: Decodable>(with request: URLRequest, type: T.Type, completion: @escaping (NetworkResponse) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            let response = NetworkResponse(data: data, response: response, error: error)
            completion(response)
        }.resume()
    }
}
