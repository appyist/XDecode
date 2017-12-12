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
    @IBOutlet var tableHeaderView: TableHeaderView!
    
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
        // Sets header of the tableView
        tableHeaderView.fill(with: recipe)
        tableView.tableHeaderView = tableHeaderView
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
        return indexPath.section == 0 ? 45.0 : UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Default height for each row before calculation begins
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // Ingredients
            if let ingredientCell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as? IngredientTableViewCell {
                // Current ingredient object at index
                let ingredientToDraw = ingredients[indexPath.row]
                ingredientCell.fill(with: ingredientToDraw)
                
                return ingredientCell
            }
        }else {
            // Directives
            if let directiveCell = tableView.dequeueReusableCell(withIdentifier: "DirectiveCell") as? DirectiveTableViewCell {
                // Current directive object at index
                let directiveToDraw = directives[indexPath.row]
                directiveCell.fill(with: directiveToDraw)
                
                return directiveCell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // Ingredients
        if section == 0 {
            return IngredientsFooterView()
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // Ingredients
        if section == 0 {
            return 60.0
        }
        
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Directives
        if section == 1 {
            let headerLabel = UILabel()
            headerLabel.font = UIFont(name: "PlayFairDisplay-Regular", size: 24.0)
            headerLabel.text = "Preparation"
            headerLabel.textAlignment = .center
            headerLabel.backgroundColor = .white

            return headerLabel
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Directives
        if section == 1 {
            return 100.0
        }
        
        return 0.0
    }
}
