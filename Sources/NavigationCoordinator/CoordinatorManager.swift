//
//  CoordinatorManager.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
internal class CoordinatorManager {
    private static var coordinators: [AnyHashable: CoordinatorBase] = [:]

    public static func coordinator<T: Routable, C: CoordinatorBase>(for type: T.Type) -> C {
        let key = String(describing: T.self)
        if let coordinator = coordinators[key] as? C {
            return coordinator
        } else {
            let coordinator = C()
            coordinators[key] = coordinator
            return coordinator
        }
    }
}
#endif
