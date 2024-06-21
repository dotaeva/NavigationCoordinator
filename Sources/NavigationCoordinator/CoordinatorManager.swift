//
//  CoordinatorManager.swift
//  
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
public class CoordinatorManager {
    private static var coordinators: [AnyHashable: CoordinatorBase] = [:]

    public static func coordinator<T: Routable>(for type: T.Type) -> Coordinator<T> {
        let key = String(describing: T.self)
        if let coordinator = coordinators[key] as? Coordinator<T> {
            return coordinator
        } else {
            let coordinator = Coordinator<T>()
            coordinators[key] = coordinator
            return coordinator
        }
    }

    public static func createCoordinator<T: Routable>(for type: T.Type) -> Coordinator<T> {
        let key = String(describing: T.self)
        let coordinator = Coordinator<T>()
        coordinators[key] = coordinator
        return coordinator
    }
}
#endif
