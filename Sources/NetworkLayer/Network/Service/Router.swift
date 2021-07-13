//
//  Router.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation
import Combine

public class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    private var cancelables = Set<AnyCancellable>()
    
    public init(){}
    
    public func request<T: Decodable>(_ route: EndPoint, type: T.Type, receivedOn queue: DispatchQueue = DispatchQueue.main) -> AnyPublisher<T, Error> {
        let request = RequestMaker.getRequest(from: route)
        switch request {
        case .success(let urlRequest):
            printRequest(request: urlRequest)
            
            return URLSession.DataTaskPublisher(request: urlRequest, session: .shared)
                .map(\.data)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    return error
                    
                }
                .receive(on: RunLoop.main)
                //            .retry(retries)
                .eraseToAnyPublisher()
        case .failure(let error):
            return AnyPublisher(Fail(error: error))
        }
    }
    
    public func cansel() {
        task?.cancel()
    }
    
    private func printRequest(request: URLRequest) {
        print("========== REQUEST ==============")
        print(">>>>> BODY: \(String(describing: request.httpBody))")
        print(">>>>> Method: \(String(describing: request.httpMethod))")
        print(">>>>> HEADERS: \(String(describing: request.allHTTPHeaderFields))")
        print("========================")
    }
    
    private func printResponse(_ response: URLResponse?, _ data: Data?, _ error: Error?) {
        print("========= Response ===============")
        if let httpResponse = response as? HTTPURLResponse {
            print(">>>>> HTTP STATUS: \(httpResponse.statusCode)")
            
        }
        print(">>>>> URL: \(String(describing: response?.url))")
        print(">>>>> Data: \(String(describing: data))")
        print(">>>>> Error: \(String(describing: error))")
        print("========================")
    }
}
