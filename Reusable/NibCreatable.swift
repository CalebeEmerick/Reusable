//
//  NibCreatable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

/// `NibCreatable` provides an easy way to create Nibs.
public protocol NibCreatable {

    func createNib<T: UIView>(type: T.Type) -> UINib where T: Reusable
}

public extension NibCreatable {
    
    /// Allows create a `UINib` just passing the `class` type.
    ///
    /// - Parameter type: The type to create the `UINib`.
    /// - Returns: Returns a `UINib`.
    func createNib<T: UIView>(type: T.Type) -> UINib where T: Reusable {
        
        let bundle = Bundle(for: type.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        
        return nib
    }
}
