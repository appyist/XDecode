//
//  IngredientsFooterView.swift
//  recipe
//
//  Created by Emirhan Erdogan on 12.12.2017.
//  Copyright © 2017 Appyist. All rights reserved.
//

import UIKit

class IngredientsFooterView: UIView, XibLoadable {

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
    
}
