//
//  TableViewReusable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

/// Provides an easy way to `register` and `dequeue` cells, headers or footerViews.
public protocol TableViewReusable : NibCreatable { }

public extension TableViewReusable where Self : UITableView {
    
    /// Register a `cell` that can be used in the `UITableView` methods.
    ///
    /// - Parameter cellClass: The `cell` type to be used in the `UITableView`.
    func register<T: UITableViewCell>(cellClass: T.Type) where T: Reusable {
        
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    /// Register a `cell` that can be used in the `UITableView` methods.
    ///
    /// **Important**
    ///
    /// - Both your files `.xib` and `.swift` **must** have the same name.
    ///
    /// - Parameter cellNib: The `cell` type to be used in the `UITableView`.
    func register<T: UITableViewCell>(cellNib: T.Type) where T: Reusable {
        
        let nib = makeNib(for: T.self)
        
        self.register(nib, forCellReuseIdentifier: T.identifier)
    }
    
    /// Register a `view` that can be used in the `UITableView`.
    ///
    /// **Important**
    ///
    /// - Remember to **not** inherit from `UIView`.
    ///
    /// - Make sure your `class` is a **UITableViewHeaderFooterView** subclass.
    ///
    /// - Parameter viewClass: The `view` type to be used as header of footer in the `UITableView`.
    func register<T: UITableViewHeaderFooterView>(viewClass: T.Type) where T: Reusable {
        
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    /// Register a `view` that can be used in the `UITableView`.
    ///
    /// **Important**
    ///
    /// - Remember to **not** inherit from `UIView`.
    ///
    /// - Make sure your `class` is a **UITableViewHeaderFooterView** subclass.
    ///
    /// - Both your files `.xib` and `.swift` **must** have the same name.
    ///
    /// - Parameter viewNib: The `view` type to be used as header of footer in the `UITableView`.
    func register<T: UITableViewHeaderFooterView>(viewNib: T.Type) where T: Reusable {
        
        let nib = makeNib(for: T.self)
        
        self.register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    /// Returns a reusable `cell` for the specified `class` and adds it to the table.
    ///
    /// **Important**
    ///
    /// - You should use the `register(cellNib: Reusable.Protocol)` or `register(cellClass: Reusable.Protocol)` to prevent insert the identifier manually.
    ///
    /// - Parameter indexPath: The `IndexPath` provided by the `UITableView` method.
    /// - Returns: Returns the reusable `cell` based in its type.
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        
        if let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T {
            
            return cell
        }
        
        fatalError("It was not possible dequeue the cell with identifier: \(T.identifier)")
    }
    
    /// Returns a reusable `view` for the specified `class` and adds it to the table.
    ///
    /// **Important**
    ///
    /// - You should use the `register(viewNib: Reusable.Protocol)` or `register(viewClass: Reusable.Protocol)` to prevent insert the identifier manually.
    ///
    /// - Returns: Returns the reusable `view` based in its type.
    func dequeueReusableView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        
        if let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T {
            
            return view
        }
        
        fatalError("It was not possible dequeue the view with identifier: \(T.identifier)")
    }
}

extension UITableView : TableViewReusable { }
