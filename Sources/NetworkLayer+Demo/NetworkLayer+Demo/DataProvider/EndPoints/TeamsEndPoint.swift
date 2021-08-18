//
//  TeamsEndPoint.swift
//  NetworkLayer+Demo
//
//  Created by Tal talspektor on 18/08/2021.
//

import Foundation
import NetworkLayer

/// Build the end point
enum TeamsEndPoint: String, EndPointType {
    
    case france = "France"
    case spain = "Spain"
    case england = "England"
    
    var baseURL: URL {
        URL(string: "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=Soccer&c=")!
    }
    
    var path: String {
        switch self {
        case .france, .england , .spain:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .france, .england , .spain:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .france, .england , .spain:
            return .requestParametest(bodyParameters: nil, urlParanatars: queryParams)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .france, .england , .spain:
            return nil
        }
    }
    
    var body: Parameters? {
        switch self {
        case .france, .england , .spain:
            return nil
        }
    }
    
    var queryParams: QueryParams? {
        switch self {
        case .france, .england , .spain:
            return ["s": "Soccer", "c": rawValue]
        }
    }
}
