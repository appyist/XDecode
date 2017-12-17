//
//  TableHeaderView.swift
//  recipe
//
//  Created by ilker on 12.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit
// import Kingfisher

class TableHeaderView: DesignableView, XibLoadable {
    
    // MARK: - UI Elements
    
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

    }
}
