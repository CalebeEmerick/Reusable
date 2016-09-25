//
//  FruitTableViewCell.swift
//  ReusableExample
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

class FruitTableViewCell : UITableViewCell {

    @IBOutlet fileprivate weak var backgroundImage: UIImageView!
    @IBOutlet fileprivate weak var fruitImage: UIImageView! { didSet { round(fruitImage) } }
    @IBOutlet fileprivate weak var fruitName: UILabel!
    
    var fruit: Fruit? { didSet { updateUI() } }
}

extension FruitTableViewCell {
    
    fileprivate func updateUI() {
        
        if let fruit = fruit {
            
            setFruit(fruit: fruit)
        }
    }
    
    fileprivate func round(_ img: UIImageView) {

        img.layer.cornerRadius = 25
        img.clipsToBounds = true
    }
    
    private func setFruit(fruit: Fruit) {
        
        self.setImage(image: fruit.image)
        self.fruitName.text = fruit.name
    }
    
    private func setImage(image: String) {
        
        let img = UIImage(named: image)
        
        self.backgroundImage.image = img
        self.fruitImage.image = img
    }
}
