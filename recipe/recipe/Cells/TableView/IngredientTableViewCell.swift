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
        // Sets the name of ingredien
        nameLabel.text = ingredient.description
        
    }

}
