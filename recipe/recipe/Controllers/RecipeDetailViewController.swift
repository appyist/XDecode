//
//  RecipeDetailViewController.swift
//  recipe
//
//  Created by Emirhan Erdogan on 11.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var recipe: Recipe!
    
    // Get-Only property, returns all ingredients of the recipe
    var ingredients: [Ingredient] {
        return recipe.ingredients
    }
    
    // Get-Only property, returns all directives of the recipe
    var directives: [String] {
        return recipe.directives
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RecipeDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Section 0 -> Ingredients
        // Section 1 -> Directives
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Section 0 -> Ingredients
        // Section 1 -> Directives
        return section == 0 ? ingredients.count : directives.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Section 0 -> Ingredients
        // Section 1 -> Directives
        // UITableViewAutomaticDimension: Calculated height that fits the content
        return indexPath.section == 0 ? 60.0 : UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Default height for each row before calculation begins
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // Ingredients
            if let ingredientCell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as? IngredientTableViewCell {
                let ingredientToDraw = recipe.ingredients[indexPath.row]
                ingredientCell.fill(with: ingredientToDraw)
                
                return ingredientCell
            }
        }else {
            // Directives
        }
        
        return UITableViewCell()
    }
}
