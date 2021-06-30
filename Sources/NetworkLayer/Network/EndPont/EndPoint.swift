//
//  EndPoint.swift
//  Coupons
//
//  Created by Tal talspektor on 25/01/2021.
//

import Foundation

public protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var body: Parameters? { get }
    var queryParams: QueryParams? { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public typealias HTTPHeaders = [String: String]
public typealias QueryParams = [String: String]
public typealias Parameters = [String: Any]

public enum HTTPTask {
    case request
    
    case requestParametest(bodyParameters: Parameters?, urlParanatars: QueryParams?)
    
    case requestParametersAnyHeaders(bodyParameters: Parameters?, urlParanatars: QueryParams?, additionalHeaders: HTTPHeaders?)
}
