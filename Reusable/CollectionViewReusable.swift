//
//  CollectionViewReusable.swift
//  Reusable
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit

public protocol CollectionViewReusable : NibCreatable { }

public extension CollectionViewReusable where Self : UICollectionView {

    func register<T: UICollectionViewCell>(cellClass: T.Type) where T: Reusable {
        
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func register<T: UICollectionViewCell>(cellNib: T.Type) where T: Reusable {
        
        let nib = createNib(bundle: T.self)
        
        self.register(nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    func register<T: UICollectionReusableView>(viewClass: T.Type, supplementaryView kind: String) where T: Reusable {
        
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }

    func register<T: UICollectionReusableView>(viewNib: T.Type, supplementaryView kind: String) where T: Reusable {
        
        let nib = createNib(bundle: T.self)
        
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
        
        return cell
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(supplementaryView kind: String, indexPath: IndexPath) -> T where T: Reusable {
        
        let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as! T
        
        return view
    }
}

extension UICollectionView : CollectionViewReusable { }
