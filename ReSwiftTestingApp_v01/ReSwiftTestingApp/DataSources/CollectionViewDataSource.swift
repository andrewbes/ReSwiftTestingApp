//
//  TableDataSource.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/16/23.
//

import UIKit

final class CollectionViewDataSource<V, T>: NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
  
  typealias CellConfiguration = (V, T) -> V
  
  var models: [T]
  private let configureCell: CellConfiguration
  private let cellIdentifier: String
  
  init(cellIdentifier: String, models: [T], configureCell: @escaping CellConfiguration) {
    self.models = models
    self.cellIdentifier = cellIdentifier
    self.configureCell = configureCell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return models.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? V
    guard let currentCell = cell else { return UICollectionViewCell() }
    let model = models[indexPath.row]
    return configureCell(currentCell, model)
  }
}
