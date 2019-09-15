//
//  BaggageItem.swift
//  Reimagine
//
//  Created by Cameron Tuckear on 9/14/19.
//  Copyright © 2019 Cameron Tucker. All rights reserved.
//

import Foundation

struct BaggageItem: Decodable {
    let objects: [Object]
}

struct Object: Decodable {
    let type: String
    let confidence: Double
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case confidence
    }
}

