//
//  Flights.swift
//  Reimagine
//
//  Created by Cameron Tuckear on 9/14/19.
//  Copyright © 2019 Cameron Tucker. All rights reserved.
//

import Foundation

struct Flight: Decodable {
    let flightNumber: String
    let aircraft: Aircraft
}

struct Aircraft: Decodable {
    let model: String
}
