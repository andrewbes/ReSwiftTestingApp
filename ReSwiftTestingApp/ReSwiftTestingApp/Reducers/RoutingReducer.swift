import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    
    switch action {
    case let routingAction as RoutingAction:
        
        state.navigationType = routingAction.navigationType
        
        switch routingAction.navigationType {
            
        case .push, .present:
            state.navigationState.append(routingAction.destination)
        case .pop, .dismiss:
            state.navigationState.removeLast()
        case .popTo:
            let currentNS = state.navigationState
            if let index = currentNS.firstIndex(where: {$0 == routingAction.destination}) {
                state.navigationState.removeLast(currentNS.count - index)
            }
        case .set:
            state.navigationState = [routingAction.destination]
        }
        
    default: break
    }
    
    return state
}
