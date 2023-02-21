//
//  colorReducer.swift
//  ReSwiftTestingApp
//
//  Created by Andrii Bezkorovainyi on 2/21/23.
//

import ReSwift

func colorReducer(action: Action, state: ColorState?) -> ColorState {
    var state = state ?? ColorState()
    if let colorAction = action as? ColorAction {
        state.colorScheme = colorAction.colorScheme
    }
    return state
}
