//
//  NibCreatable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

protocol NibCreatable {

    func createNib<T: UIView>(bundle: T.Type) -> UINib where T: Reusable
}

extension NibCreatable {
    
    func createNib<T: UIView>(bundle: T.Type) -> UINib where T: Reusable {
        
        let bundle = Bundle(for: bundle.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        
        return nib
    }
}
