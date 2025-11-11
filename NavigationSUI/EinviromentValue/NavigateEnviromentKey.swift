//
//  NavigateEnviromentKey.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import Foundation
import SwiftUI

struct NavigateEnvironmentKey: EnvironmentKey {
    static var defaultValue = NavigateAction { _ in }
}

extension EnvironmentValues {
    var navigate: NavigateAction {
        get {
            self[NavigateEnvironmentKey.self]
        }
        set {
            self[NavigateEnvironmentKey.self] = newValue
        }
    }
}