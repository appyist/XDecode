//
//  RecipeCollectionViewCell.swift
//  recipe
//
//  Created by Emirhan Erdogan on 10.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // Only used within horizontal layout
    @IBOutlet weak var categoryLabel: UILabel?
    @IBOutlet weak var duratiLabel: UILabel?
    
    // MARK: - Variables
    
    /// Identifier that is used by collectionView to create a cell from this type.
    class var identifier: String {
        return "RecipeCollectionViewCell"
    }
    
    // MARK: - Functions
    func fill(with recipe: Recipe) {
        // Downloads the image from provided url and sets image with animation.
        imageView.kf.setImage(with: recipe.image, options: [.transition(.fade(0.2))])
        
        // Sets the name of recipe
        nameLabel.text = recipe.name
        
        // Creates a single String from [String] separated by ', ' and
        // Sets the category of recipe
        let categoryText = recipe.categories.joined(separator: ", ")
        categoryLabel?.text = categoryText
        
        // Sets the duration
        let durationText = "Under \(recipe.cookTime)"
        duratiLabel?.text = durationText
    }
}
