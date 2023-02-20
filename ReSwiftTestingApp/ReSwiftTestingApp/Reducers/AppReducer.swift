import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
   return AppState(
    routingState: routingReducer(action: action, state: state?.routingState),
    menuState: menuReducer(action: action, state: state?.menuState))
}
