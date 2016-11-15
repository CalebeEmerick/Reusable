# Reusable
Reusable makes easy register and dequeue cells and views.

## Instalation
  - If you use `xcworkspace`, just download and put the project inside it.
  - Otherwise, you can create a folder and drop the files there.

## Usage
  
**Register**

You should register the cells or views before dequeue it.

- When your Cell and/or View is separated from the Storyboard:
```swift
tableView.register(cellNib: YourCell.self)
tableView.register(viewNib: YourView.self)
collectionView.register(cellNib: YourCell.self)
collectionView.register(viewNib: YourView.self)
```
- When your cell and/or View is coupled with Storyboard:
```swift
tableView.register(cellClass: YourCell.self)
tableView.register(viewClass: YourView.self)
collectionView.register(cellClass: YourCell.self)
collectionView.register(viewClass: YourView.self)
```

**Dequeue**

```swift
tableView.dequeueReusableCell(indexPath: indexPath)
```