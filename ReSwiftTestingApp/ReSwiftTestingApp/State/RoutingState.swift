import ReSwift

enum NavigationType {
    case push
    case pop
    case popTo
    case set
    case present
    case dismiss
}

struct RoutingState {
    var navigationState: [RoutingDestination]
    var navigationType: NavigationType
    
    init(navigationState: [RoutingDestination] = [.menu], navigationType: NavigationType = .set) {
        self.navigationState = navigationState
        self.navigationType = navigationType
    }
}
