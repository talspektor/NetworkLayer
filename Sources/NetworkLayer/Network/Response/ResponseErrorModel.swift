//
//  ResponseErrorModel.swift
//  Coupons-System
//
//  Created by Tal Spektor on 07/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import Foundation

struct ResponseErrorModel: Codable {
    let status: Int
    let error: String
    let message: String
    let path: String
}
