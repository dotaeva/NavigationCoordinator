//
//  Coordinator.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
public class NavigationCoordinator<T: Routable>: CoordinatorBase {
    required init() {
        super.init()
    }
    
    internal var typedRoot: T? {
        get {
            super.root as? T
        }
        set {
            super.root = newValue
        }
    }

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

extension NavigationCoordinator {
    /// Returns the current navigation path.
    /// - Returns: An array representing the current path of type `[T]`.
    public static var path: [T] {
        get {
            (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedPath
        }
    }
    
    /// Gets or sets the root of the coordinator.
    /// - Returns: The root of type `T`.
    public static var root: T? {
        get {
            (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedRoot
        }
        set {
            (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedRoot = newValue
        }
    }
}
#endif
