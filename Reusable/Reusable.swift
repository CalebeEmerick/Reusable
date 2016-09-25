//
//  Reusable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

/// `Reusable` provides an identifier for every class that inherits from `UIView`.
public protocol Reusable {
    
    static var identifier: String { get }
}

public extension Reusable where Self : UIView {
    
    /// Uses the `class` name to provide an identifier.
    static var identifier: String {
        
        return String(describing: self)
    }
}

extension UIView : Reusable { }
