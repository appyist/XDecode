//
//  Recipe.swift
//  recipe
//
//  Created by ilker on 9.12.2017.
//  Copyright © 2017 ilker. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    enum Difficulty: Int, Codable {
        case easy
        case medium
        case hard
    }
    
    var id: String
    var image: URL
    var categories: [String]
    var servings: Int
    var cookTime: Int
    var difficulty: Difficulty
    var ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case id, image, categories, servings, cookTime, difficulty, ingredients
    }
}
