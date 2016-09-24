//
//  TableViewReusable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

protocol TableViewReusable : NibCreatable { }

extension TableViewReusable where Self : UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type) where T: Reusable {
        
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func register<T: UITableViewCell>(cellNib: T.Type) where T: Reusable {
        
        let nib = createNib(bundle: T.self)
        
        self.register(nib, forCellReuseIdentifier: T.identifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(viewClass: T.Type) where T: Reusable {
        
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(viewNib: T.Type) where T: Reusable {
        
        let nib = createNib(bundle: T.self)
        
        self.register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        
        let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
        
        return cell
    }
    
    func dequeueReusableView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        
        let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as! T
        
        return view
    }
}

extension UITableView : TableViewReusable { }
