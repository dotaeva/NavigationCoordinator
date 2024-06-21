//
//  NavigationCoordinatorFunctions.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import Foundation

#if os(iOS)
extension NavigationCoordinator {
    /// Routes to the specified destination.
    /// - Parameter destination: The destination to route to.
    public static func route(to destination: T) {
        (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedPath.append(destination)
    }
    
    /// Presents the specified item as a sheet or full-screen cover.
    /// - Parameters:
    ///   - item: The item to present.
    ///   - type: The presentation type (sheet or full-screen cover).
    public static func present(_ item: T, as type: PresentationType) {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        switch type {
        case .sheet:
            coordinator.typedSheet = item
        case .fullScreenCover:
            coordinator.typedFullScreenCover = item
        }
    }
    
    /// Dismisses the currently presented item or the top-most route.
    public static func dismiss() {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if let fullScreenCover = coordinator.typedFullScreenCover {
            coordinator.typedFullScreenCover = nil
        } else if let sheet = coordinator.typedSheet {
            coordinator.typedSheet = nil
        }
    }
    
    /// Dismisses the currently presented item or the top-most route.
    /// - Returns: The dismissed item or route, if any.
    public static func pop() -> T? {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if let fullScreenCover = coordinator.typedFullScreenCover {
            coordinator.typedFullScreenCover = nil
            return fullScreenCover
        } else if let sheet = coordinator.typedSheet {
            coordinator.typedSheet = nil
            return sheet
        } else {
            return coordinator.typedPath.popLast()
        }
    }
    
    /// Pops all routes to return to the root.
    public static func popToRoot() {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        coordinator.typedPath.removeAll()
    }
    
    /// Pops all routes until the specified route is reached.
    /// - Parameter route: The route to pop to.
    /// - Note: Prints an error if the specified route is not found in the path.
    public static func popToLast(_ route: T) {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if let index = coordinator.typedPath.lastIndex(where: { $0 == route }) {
            coordinator.typedPath = Array(coordinator.typedPath.prefix(through: index))
        } else {
            print("Error: Route not found in the path")
        }
    }
    
    /// Returns the top-most route without removing it from the stack.
    /// - Returns: The top-most route, if any.
    public static func peek() -> T? {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        return coordinator.typedPath.last
    }
}
#endif
