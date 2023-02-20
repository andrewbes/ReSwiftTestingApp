import ReSwift

enum RoutingDestination: String, CaseIterable {
    case menu = "MenuTableViewController"
    case game = "GameViewController"
    case settings = "SettingsTableViewController"
    case rules = "RulesPopupViewController"
    
    
    var storyboard: String {
        switch self {
        case .menu:
            return "MenuScreen"
        case .game:
            return "GameScreen"
        case .settings:
            return "SettingsScreen"
        case .rules:
            return "RulesPopupScreen"
        }
    }
}

final class AppRouter {
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
        
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    fileprivate func pushViewController(identifier: RoutingDestination, animated: Bool) {
        let viewController = instantiateViewController(identifier: identifier)
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    fileprivate func popToViewController(identifier: RoutingDestination, animated: Bool) {
        let viewController = instantiateViewController(identifier: identifier)
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    fileprivate func popViewController(animated: Bool) {
        navigationController.popViewController( animated: animated)
    }
    
    fileprivate func presentViewController(identifier: RoutingDestination, animated: Bool) {
        let viewController = instantiateViewController(identifier: identifier)
        navigationController.present(viewController, animated: animated)
    }
    
    fileprivate func dismissViewController(animated: Bool) {
        navigationController.dismiss( animated: animated)
    }
    
    fileprivate func setViewController(identifier: RoutingDestination, animated: Bool) {
        let viewController = instantiateViewController(identifier: identifier)
        navigationController.setViewControllers([viewController], animated: animated)
    }
    
    private func instantiateViewController(identifier: RoutingDestination) -> UIViewController {
        return Storyboard.controller[identifier] ?? UIViewController()
    }
}

// MARK: - StoreSubscriber

extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        
        let animated = navigationController.topViewController != nil
        
        guard let controller = state.navigationState.last else { return }
        
        switch state.navigationType {
            
        case .push:
            pushViewController(identifier: controller, animated: animated)
        case .pop:
            popViewController(animated: animated)
        case .popTo:
            popToViewController(identifier: controller, animated: animated)
        case .set:
            setViewController(identifier: controller, animated: false)
        case .present:
            presentViewController(identifier: controller, animated: animated)
        case .dismiss:
            dismissViewController(animated: animated)
        }
        
    }
}
