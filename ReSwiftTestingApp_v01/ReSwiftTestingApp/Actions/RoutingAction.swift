//
//  RoutingAction.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/16/23.
//

import ReSwift

struct RoutingAction: Action {
    let destination: RoutingDestination
    let navigationType: NavigationType
}
