import ReSwift

final class MenuTableViewController: UITableViewController {
    
    var tableDataSource: TableViewDataSource<UITableViewCell, String>?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) {
            $0.select {
                $0.menuState
            }
        }
        
        store.dispatch(RoutingAction(destination: .menu, navigationType: .popTo))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let routeDestination = RoutingDestination.allCases
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                store.dispatch(RoutingAction(destination: .settings, navigationType: .push))
            case 1:
                store.dispatch(RoutingAction(destination: .rules, navigationType: .present))
            case 2:
                store.dispatch(RoutingAction(destination: .game, navigationType: .push))
            default:
             break
            }
        }
        else {
            store.dispatch(RoutingAction(destination: routeDestination[2], navigationType: .push))
        }
    }
}

// MARK: - StoreSubscriber
extension MenuTableViewController: StoreSubscriber {
    
    func newState(state: MenuState) {
        var table = TableModel<String>(sections: [])
        state.sections.forEach({table.sections.append(.init(headerTitle: $0.sectionTitle, cellsModel: $0.items))})
        
        tableDataSource = TableViewDataSource(cellIdentifier:"TitleCell", model: table) {cell, item in
            cell.textLabel?.text = item
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
        tableView.dataSource = tableDataSource
        tableView.reloadData()
    }
}
