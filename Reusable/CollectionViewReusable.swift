//
//  CollectionViewReusable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

/// Provides an easy way to `register` and `dequeue` cells, headers or footerViews.
public protocol CollectionViewReusable : NibCreatable { }

public extension CollectionViewReusable where Self : UICollectionView {

    /// Register a `cell` that can be used in the `UICollectionView` methods.
    ///
    /// - Parameter cellClass: The `cell` type to be used in the `UICollectionView`.
    func register<T: UICollectionViewCell>(cellClass: T.Type) where T: Reusable {
        
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    /// Register a `cell` that can be used in the `UICollectionView` methods.
    ///
    /// **Important**
    ///
    /// - Both your files `.xib` and `.swift` **must** have the same name.
    ///
    /// - Parameter cellNib: The `cell` type to be used in the `UICollectionView`.
    func register<T: UICollectionViewCell>(cellNib: T.Type) where T: Reusable {
        
        let nib = createNib(type: T.self)
        
        self.register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    /// Register a `view` that can be used in the `UICollectionView`.
    ///
    /// **Important**
    ///
    /// - Remember to **not** inherit from `UIView`.
    ///
    /// - Make sure your `class` is a **UICollectionReusableView** subclass.
    ///
    /// - You **must** choose one of these types: `UICollectionElementKindSectionFooter` or `UICollectionElementKindSectionHeader`.
    ///
    /// - Parameters:
    ///   - viewClass: The `view` type to be used as header of footer in the `UICollectionView`.
    ///   - kind: The `String` defined to represent header or footer.
    func register<T: UICollectionReusableView>(viewClass: T.Type, supplementaryView kind: String) where T: Reusable {
        
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }

    /// Register a `view` that can be used in the `UICollectionView`.
    ///
    /// **Important**
    ///
    /// - Remember to **not** inherit from `UIView`.
    ///
    /// - Make sure your `class` is a **UICollectionReusableView** subclass.
    ///
    /// - You **must** choose one of these types: `UICollectionElementKindSectionFooter` or `UICollectionElementKindSectionHeader`.
    ///
    /// - Both your files `.xib` and `.swift` **must** have the same name.
    ///
    /// - Parameters:
    ///   - viewNib: The `view` type to be used as header of footer in the `UICollectionView`.
    ///   - kind: The `String` defined to represent header or footer.
    func register<T: UICollectionReusableView>(viewNib: T.Type, supplementaryView kind: String) where T: Reusable {
        
        let nib = createNib(type: T.self)
        
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }

    /// Returns a reusable `cell` for the specified `class` and adds it to the collection.
    ///
    /// **Important**
    ///
    /// - You should use the `register(cellNib: Reusable.Protocol)` or `register(cellClass: Reusable.Protocol)` to prevent insert the identifier manually.
    ///
    /// - Parameter indexPath: The `IndexPath` provided by the `UICollectionView` method.
    /// - Returns: Returns the reusable `cell` based in its type.
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        
        if let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T {
            
            return cell
        }
        
        fatalError("It was not possible dequeue the cell with identifier: \(T.identifier)")
    }
    
    /// Returns a reusable `view` for the specified `class` and adds it to the collection.
    ///
    /// **Important**
    ///
    /// - You should use the `register(viewNib: Reusable.Protocol)` or `register(viewClass: Reusable.Protocol)` to prevent insert the identifier manually.
    ///
    /// - You **must** choose one of these types: `UICollectionElementKindSectionFooter` or `UICollectionElementKindSectionHeader`.
    ///
    /// - Parameters:
    ///   - kind: The `String` defined to represent header or footer.
    ///   - indexPath: The `IndexPath` provided by the `UICollectionView` method.
    /// - Returns: Returns the reusable `view` based in its type.
    func dequeueReusableView<T: UICollectionReusableView>(supplementaryView kind: String, indexPath: IndexPath) -> T where T: Reusable {
        
        if let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as? T {
            
            return view
        }
        
        fatalError("It was not possible dequeue the view with identifier: \(T.identifier)")
    }
}

extension UICollectionView : CollectionViewReusable { }
