//
//  NavigationAction.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import Foundation

struct NavigateAction {
    typealias Action = (NavigationType) -> Void
    let action: Action
    func callAsFunction(_ type: NavigationType) {
        action(type)
    }
}
