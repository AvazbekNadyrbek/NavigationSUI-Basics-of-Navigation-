//
//  NavigationType.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import Foundation

enum NavigationType: Hashable {
    case push(Route)
    case unwind(Route )
}
