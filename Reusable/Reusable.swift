//
//  Reusable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

protocol Reusable {
    
    static var identifier: String { get }
}

extension Reusable where Self : UIView {
    
    static var identifier: String {
        
        return String(describing: self)
    }
}

extension UIView : Reusable { }
