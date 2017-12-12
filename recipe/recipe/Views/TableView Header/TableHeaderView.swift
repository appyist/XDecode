//
//  TableHeaderView.swift
//  recipe
//
//  Created by ilker on 12.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit
import Kingfisher

class TableHeaderView: DesignableView, XibLoadable {
    
    // MARK: - UI Elements
    @IBOutlet weak var shortInfoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Loads designed view from .xib file
        loadViewFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Loads designed view from .xib file
        loadViewFromXib()
    }
    
    func fill(with recipe: Recipe) {
        shortInfoLabel.text = recipe.shortInfo
        imageView.kf.setImage(with: recipe.image, options: [.transition(.fade(0.2))])
        difficultyLabel.text = recipe.difficulty.rawValue
        cookTimeLabel.text = "\(recipe.cookTime) min"
        servingsLabel.text = "\(recipe.servings) serves"
    }
}
