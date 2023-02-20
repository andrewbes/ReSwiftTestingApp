//
//  TableDataSource.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/16/23.
//

import UIKit

struct TableModel<T> {
    struct SectionModel {
        var headerTitle: String
        var cellsModel: [T]
    }
    var sections: [SectionModel]
}

final class TableViewDataSource<C, T> : NSObject, UITableViewDataSource where C: UITableViewCell {

    typealias CellConfiguration = (C, T) -> C
    typealias SectionHeaderConfiguration = () -> String
    
    private let model: TableModel<T>
    private let configureCell: CellConfiguration
    private let cellIdentifier: String
    
    init(cellIdentifier: String, model: TableModel<T>, configureCell: @escaping CellConfiguration) {
        self.model = model
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sections[section].cellsModel.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? C
        
        guard let currentCell = cell else { return UITableViewCell() }
        let model = model.sections[indexPath.section].cellsModel[indexPath.row]
        return configureCell(currentCell, model)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section].headerTitle
    }
}
