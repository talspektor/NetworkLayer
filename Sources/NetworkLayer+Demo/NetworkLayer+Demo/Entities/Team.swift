//
//  Team.swift
//  NetworkLayer+Demo
//
//  Created by Tal talspektor on 18/08/2021.
//

import Foundation

struct Team: Decodable {
    let idTeam: String
    let strLeague: String
    let strTeam: String
}

struct TeamsResult: Decodable {
    let teams: [Team]
}
