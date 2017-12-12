
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
    @IBOutlet var headerView: UIView!
    
    // MARK: - Variables
    var trendingRecipies: [Recipe]!
    var recentRecepies: [Recipe]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Registering headers by collectionView to be able to reuse it
        let kind = UICollectionElementKindSectionHeader
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: "CollectionHeader")
        collectionView.register(CollectionSectionHeaderView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: "SectionHeader")

        let tr1 = Recipe(id: "0", image: URL(string: "https://static.pexels.com/photos/70497/pexels-photo-70497.jpeg")!, name: "Alfredo patato with spinach", categories: ["Breakfast", "Appetizer"], servings: 10, cookTime: 8, difficulty: .easy, ingredients: [])
        let tr2 = Recipe(id: "1", image: URL(string: "https://drop.ndtv.com/albums/COOKS/corngallery/creolespicedcornthumb_640x480.jpg")!, name: "Coffee gronola row fruit", categories: ["Dinner", "Lunch"], servings: 10, cookTime: 3, difficulty: .easy, ingredients: [])
        let tr3 = Recipe(id: "2", image: URL(string: "https://media2.s-nbcnews.com/j/newscms/2017_10/1200234/10-healthy-fast-food-meals-008-subway-inline-today-170309_89a32509f1b93e969a831a913cc2a2d1.today-inline-large.jpg")!, name: "Berry berry strawberry pie", categories: [], servings: 10, cookTime: 5, difficulty: .easy, ingredients: [])
        let tr4 = Recipe(id: "3", image: URL(string: "https://www.colourbox.com/preview/2226606-salad-with-vegetables-and-greens.jpg")!, name: "A simple toast with eggs", categories: [], servings: 10, cookTime: 20, difficulty: .medium, ingredients: [])
        
        trendingRecipies = [tr1, tr2, tr3, tr4]
        recentRecepies = [tr1, tr2]
    }
    
    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If controller that is about to be shown is 'RecipeDetailViewController'
        // and sender is an object of kind: 'Recipe'
        if let destination = segue.destination as? RecipeDetailViewController, let recipe = sender as? Recipe {
            destination.recipe = recipe
        }
    }
    
    func dataSource(forSection section: Int) -> [Recipe] {
        // Returns 'trendingRecipies' if section is 0, else 'recentRecepies'
        return section == 0 ? trendingRecipies : trendingRecipies
    }
}

extension RecipeExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Sections: 'Header View', 'Trending This Week', 'Recent'
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Number of cells that collectionView will draw for each section
        // Section 0 is only for header therefore 0 item(cell)
        return section == 0 ? 0 : dataSource(forSection: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Recipes for this section
        let currentDataSource = dataSource(forSection: indexPath.section)
        
        // Recipe which will be used by the cell
        let recipeToDraw = currentDataSource[indexPath.row]
        
        // Identifier for cell
        let cellIdentifier = indexPath.section == 1 ? "PortraitRecipeCell" : "LandscapeRecipeCell"
        
        // Creates a cell of type 'RecipeCollectionViewCell' if found in storyboard with identifier
        // Fills it with provided recipe
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? RecipeCollectionViewCell {
            cell.fill(with: recipeToDraw)
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenWidth = view.bounds.width
        
        if section == 0 {
            // Collection Header
            return CGSize(width: screenWidth, height: 300.0)
        }else {
            // Collection Section Header
            return CGSize(width: screenWidth, height: 82.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            // Collection Header
            let identifier = "CollectionHeader"
            if let collectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? CollectionHeaderView {
                collectionHeaderView.fill(with: #imageLiteral(resourceName: "Dummy Header"), title: "Christmas Creamy Pear Pie")
                
                return collectionHeaderView
            }
        }else {
            // Collection Section Header
            let identifier = "SectionHeader"
            if let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? CollectionSectionHeaderView {
                let title = indexPath.section == 1 ? "Trending This Week" : "Recent"
                sectionHeaderView.fill(title: title)
                
                return sectionHeaderView
            }
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentDataSource = dataSource(forSection: indexPath.section)
        let selectedRecipe = currentDataSource[indexPath.row]
        
        // Goes to 'RecipeDetailViewController' with 'selectedRecipe' object
        performSegue(withIdentifier: "toRecipeDetail", sender: selectedRecipe)
    }
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
        
        if indexPath.section == 1 {
            // Portrait Cell Layout: |-10-[cell]-10-[cell]-10-|
            let numberOfCellsInASingleRow: CGFloat = 2.0
            let cellWidth = (screenWidth - spaceBetweenCells * 3.0) / numberOfCellsInASingleRow
            cellSize = CGSize(width: cellWidth , height: 200.0)
        }else if indexPath.section == 2 {
            // Landscape Cell Layout: |-10-[cell]-10-|
            let cellWidth = screenWidth - spaceBetweenCells * 2.0
            cellSize = CGSize(width: cellWidth, height: 155.0)
        }
        
        return cellSize
    }
}
