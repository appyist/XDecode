//
//  IngredientTableViewCell.swift
//  recipe
//
//  Created by Emirhan Erdogan on 12.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityUnitLabel: UILabel!
    
    // MARK: - Functions
    func fill(with ingredient: Ingredient) {
        // Sets the name of ingredient
        nameLabel.text = ingredient.description
        
        // Creates a formatted text from quantity and unit, sets the text of label
        let quantity = ingredient.quantity
        let unit = ingredient.unit
        let quantityUnitText = "\(quantity) \(unit)"
        
        quantityUnitLabel.text = quantityUnitText
    }
}
