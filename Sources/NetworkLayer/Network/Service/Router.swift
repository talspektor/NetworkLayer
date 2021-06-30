//
//  Router.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

public class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    public init(){}
    
    public func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try RequestMaker.getRequest(from: route)
            printRequest(request: request)
            task = session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
                self?.printResponse(response, data, error)
                completion(NetworkResponseItem(data: data, response: response, error: error))
            })
        } catch {
            print(">>>>> Error: \(String(describing: error))")
            completion(NetworkResponseItem(data: nil, response: nil, error: error))
        }
        self.task?.resume()
    }
    
    func cansel() {
        self.task?.cancel()
    }
    
    private func printRequest(request: URLRequest) {
        print("========================")
        print(">>>>> REQUEST BODY \(String(describing: request.httpBody))")
        print(">>>>> REQUEST Method \(String(describing: request.httpMethod))")
        print(">>>>> REQUEST HEADERS \(String(describing: request.allHTTPHeaderFields))")
        print("========================")
    }
    
    private func printResponse(_ response: URLResponse?, _ data: Data?, _ error: Error?) {
        print("========================")
        if let httpResponse = response as? HTTPURLResponse {
            print(">>>>> HTTP STATUS: \(httpResponse.statusCode)")
            
        }
        print(">>>>> URL: \(String(describing: response?.url))")
        print(">>>>> Data: \(String(describing: data))")
        print(">>>>> Error: \(String(describing: error))")
        print("========================")
    }
}
