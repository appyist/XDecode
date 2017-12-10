
//
//  RecipeExploreViewController.swift
//  recipe
//
//  Created by Emirhan Erdogan on 10.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit

class RecipeExploreViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var trendingRecipies: [Recipe]!
    var recentRecepies: [Recipe]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If controller that is about to be shown is 'RecipeDetailViewController'
        // and sender is an object of kind: 'Recipe'
        if let destination = segue.destination as? RecipeDetailViewController, let recipe = sender as? Recipe {
            // TODO: Fill
        }
    }
    
    func dataSource(forSection section: Int) -> [Recipe] {
        // Returns 'trendingRecipies' if section is 0, else 'recentRecepies'
        return section == 0 ? trendingRecipies : recentRecepies
    }
}

extension RecipeExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Sections: 'Trending This Week', 'Recent'
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Number of cells that collectionView will draw for each section
        return section == 0 ? trendingRecipies.count : recentRecepies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Recipes for this section
        let currentDataSource = dataSource(forSection: indexPath.section)
        
        // Recipe which will be used by the cell
        let recipeToDraw = currentDataSource[indexPath.row]
        
        // Identifier for reusing
        let cellIdentifier = RecipeCollectionViewCell.identifier
        
        // Creates a cell of type 'RecipeCollectionViewCell' if found in storyboard with identifier
        // Fills it with provided recipe
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? RecipeCollectionViewCell {
            cell.fill(with: recipeToDraw)
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentDataSource = dataSource(forSection: indexPath.section)
        let selectedRecipe = currentDataSource[indexPath.row]
        let segueIdentifier = Constants.SegueIdentifier.toRecipeDetail
        
        // Goes to 'RecipeDetailViewController' with 'selectedRecipe' object
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: selectedRecipe)
    }
    
    // TODO: Header View
}

extension RecipeExploreViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Spacing between each row
        return section == 0 ? 10.0 : 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Spacing between each column in a row
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Total width of current screen
        let screenWidth = view.bounds.width
        let spaceBetweenCells: CGFloat = 10.0
        var cellSize: CGSize!
        
        if indexPath.section == 0 {
            // Row Layout: |-10-[cell]-10-[cell]-10-|
            let numberOfCellsInASingleRow: CGFloat = 2.0
            let cellWidth = screenWidth - spaceBetweenCells * 3.0 / numberOfCellsInASingleRow
            cellSize = CGSize(width: cellWidth , height: 200.0)
        }else {
            // Row Layout: |-10-[cell]-10-|
            let cellWidth = screenWidth - spaceBetweenCells * 2.0
            cellSize = CGSize(width: cellWidth, height: 155.0)
        }
        
        return cellSize
    }
}

fileprivate extension RecipeExploreViewController {
    
    struct Constants {
        enum SegueIdentifier: String {
            case toRecipeDetail
        }
    }
}

