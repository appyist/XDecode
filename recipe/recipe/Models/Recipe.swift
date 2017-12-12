//
//  Recipe.swift
//  recipe
//
//  Created by ilker on 9.12.2017.
//  Copyright © 2017 ilker. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    
    enum Difficulty: String, Codable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }
    
    var id: String
    var image: URL
    var name: String
    var shortInfo: String
    var categories: [String]
    var servings: Int
    var cookTime: Int
    var difficulty: Difficulty
    var ingredients: [Ingredient]
    var directives: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, image, name, shortInfo, categories, servings, cookTime, difficulty, ingredients, directives
    }
}
