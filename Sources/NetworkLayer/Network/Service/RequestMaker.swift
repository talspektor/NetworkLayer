//
//  BuildRequest..swift
//  
//
//  Created by Tal Spektor on 29/06/2021.
//

import Foundation

enum RequestMaker {
    static func getRequest(from route: EndPointType) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParametest(let bodyParameters, let urlParameters):

                try self.configurePrameters(bodyParameters: bodyParameters,
                                            urlParameters: urlParameters,
                                            request: &request)
            case .requestParametersAnyHeaders(let bodyParameters, let urlParameters, let additionalHeaders):

                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configurePrameters(bodyParameters: bodyParameters,
                                            urlParameters: urlParameters,
                                            request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    static private func configurePrameters(bodyParameters: Parameters?, urlParameters: QueryParams?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encoder(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encoder(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    static private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
