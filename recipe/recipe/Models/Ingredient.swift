//
//  Ingredient.swift
//  recipe
//
//  Created by ilker on 9.12.2017.
//  Copyright © 2017 ilker. All rights reserved.
//

import Foundation

struct Ingredient: Codable {
    
    var description: String
    var quantity: String
    var unit: String
    
    enum CodingKeys: String, CodingKey {
        case description, quantity, unit
    }
}
