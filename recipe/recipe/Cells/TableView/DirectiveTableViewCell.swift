//
//  DirectiveTableViewCell.swift
//  recipe
//
//  Created by Emirhan Erdogan on 12.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit

class DirectiveTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Functions
    func fill(with directive: String) {
        // Sets the text of descriptionLabel with given string
        descriptionLabel.text = directive
    }
}
