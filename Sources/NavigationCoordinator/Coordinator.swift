//
//  Coordinator.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
public class Coordinator<T: Routable>: CoordinatorBase {
    override init() {
        super.init()
    }
    
    internal var root: T?

    internal var typedPath: [T] {
        get {
            super.path.compactMap { $0 as? T }
        }
        set {
            super.path = newValue
        }
    }

    internal var typedFullScreenCover: T? {
        get {
            super.fullScreenCover as? T
        }
        set {
            super.fullScreenCover = newValue
        }
    }

    internal var typedSheet: T? {
        get {
            super.sheet as? T
        }
        set {
            super.sheet = newValue
        }
    }
}

extension Coordinator {
    public static var path: [T] {
        get {
            CoordinatorManager.coordinator(for: T.self).typedPath
        }
        set {
            CoordinatorManager.coordinator(for: T.self).typedPath = newValue
        }
    }
}
#endif
