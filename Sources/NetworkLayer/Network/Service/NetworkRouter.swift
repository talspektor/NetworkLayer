//
//  NetworkRouter.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

public struct NetworkResponseItem {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    @available(OSX 10.15, *)
    func request<T: Decodable>(_ route: EndPoint, type: T.Type, receivOn queue: DispatchQueue) -> AnyPublisher<T, Error>
    func cansel()
}
