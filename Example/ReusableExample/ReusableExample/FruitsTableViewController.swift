//
//  FruitsTableViewController.swift
//  ReusableExample
//
//  Created by Calebe Emerick on 24/09/16.
//  Copyright © 2016 CodeLLamas. All rights reserved.
//

import UIKit
import Reusable

// MARK: - Variables and Outlets -

class FruitsTableViewController : UITableViewController {

    fileprivate var vitamins: [Vitamin] = []
}

// MARK: - Life Cycle -

extension FruitsTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        // fill mock array
        fillVitamins()
    }
}

// MARK: - Private Methods -

extension FruitsTableViewController {
    
    fileprivate func setupTableView() {
        
        tableView.register(cellNib: FruitTableViewCell.self)
        tableView.register(viewNib: FruitHeaderView.self)
    }
}

// MARK: - UITableViewDataSource -

extension FruitsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return vitamins.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vitamins[section].fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FruitTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        
        cell.fruit = vitamins[indexPath.section].fruits[indexPath.row]
        
        return cell
    }
}

// MARK: - UITableViewDelegate -

extension FruitsTableViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: FruitHeaderView = tableView.dequeueReusableView()
        
        headerView.name = vitamins[section].name
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
}

// MARK: - Mock -

extension FruitsTableViewController {
    
    fileprivate func fillVitamins() {
        
        vitamins = [
            
            Vitamin(name: "Vitamin C", fruits: [
                
                Fruit(name: "Guava", image: "guava"),
                Fruit(name: "Kiwi", image: "kiwi"),
                Fruit(name: "Orange", image: "orange"),
                Fruit(name: "Strawberry", image: "strawberry"),
                Fruit(name: "Mango", image: "mango")
            ]),
            Vitamin(name: "Vitamin A", fruits: [
                
                Fruit(name: "Banana", image: "banana"),
                Fruit(name: "Avocado", image: "avocado"),
                Fruit(name: "Passion Fruit", image: "passion-fruit"),
                Fruit(name: "Pear", image: "pear"),
                Fruit(name: "Pineapple", image: "pineapple")
            ])
        ]
    }
}


class asd: NSObject, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(indexPath: indexPath)
    }
}



