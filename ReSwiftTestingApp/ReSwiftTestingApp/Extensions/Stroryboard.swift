//
//  Storyboard.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/16/23.
//

import UIKit

struct Storyboard {
    static var controller: [RoutingDestination: UIViewController] {
        return RoutingDestination.allCases.reduce(into: [RoutingDestination: UIViewController]()) { $0[$1]=UIStoryboard(name: $1.storyboard, bundle: nil).instantiateViewController(withIdentifier: $1.rawValue)}
    }
}
