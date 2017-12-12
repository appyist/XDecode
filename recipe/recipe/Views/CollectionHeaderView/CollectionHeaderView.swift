//
//  CollectionHeaderView.swift
//  recipe
//
//  Created by Emirhan Erdogan on 11.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView, XibLoadable {
    
    // MARK: - UI Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
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
    
    // MARK: - Functions
    func fill(with image: UIImage, title: String?) {
        // Sets the image of imageView.
        imageView.image = image
        
        // Sets the title of header if avaible.
        titleLabel.text = title
    }
}