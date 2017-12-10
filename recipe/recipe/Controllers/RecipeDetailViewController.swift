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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
