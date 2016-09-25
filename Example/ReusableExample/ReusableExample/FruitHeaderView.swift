//
//  FruitHeaderView.swift
//  ReusableExample
//
//  Created by Calebe Emerick on 25/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

class FruitHeaderView : UITableViewHeaderFooterView {

    @IBOutlet fileprivate weak var headerName: UILabel!
    
    var name: String? { didSet { updateUI() } }
}

extension FruitHeaderView {
    
    fileprivate func updateUI() {
        
        if let name = name {
            
            setHeaderName(name: name)
        }
    }
    
    private func setHeaderName(name: String) {
        
        self.headerName.text = name
    }
}
