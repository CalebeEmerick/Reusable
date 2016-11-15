# Reusable
Reusable makes easy register and dequeue cells and views.

## Instalation
  - If you use `xcworkspace`, just download and put the project inside it.
  - Otherwise, you can create a folder and drop the files there.

## Usage
  
**Register**

You should register the cells or views before dequeue it.

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	
	// cells
	tableView.register(cellNib: MyCustomTableViewCell.self)
	collectionView.register(cellNib: MyCustomCollectionViewCell.self)
	
	// views
	tableView.register(viewNib: CustomTableViewHeader.self)
	collectionView.register(viewNib: CustomCollectionViewFooter.self, ofKind: UICollectionElementKindSectionFooter)
}
```

**Dequeue**

```swift
// cells

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
	let cell: MyCustomTableViewCell = tableView.dequeueReusableCell(for: indexPath)
    return cell
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell: MyCustomCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    return cell
}

// views

func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let headerView: CustomTableViewHeader = tableView.dequeueReusableView()
    return headerView
}

func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 
   if kind == UICollectionElementKindSectionFooter {

        let footer: CustomCollectionViewFooter = collectionView.dequeueReusableView(ofKind: UICollectionElementKindSectionFooter, for: indexPath)
        return footer
    }

    fatalError("It should show the CollectionView Footer, not enter here... 😐")
}
```

## License

Reusable is released under the MIT license. See LICENSE for details.
