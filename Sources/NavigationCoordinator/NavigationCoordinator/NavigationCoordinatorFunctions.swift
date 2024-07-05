//
//  NavigationCoordinatorFunctions.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
extension NavigationCoordinator {
    /// Routes to the specified destination with an optional modifier.
    /// - Parameters:
    ///   - destination: The destination to route to.
    ///   - modifier: A closure to modify the view.
    public static func route(to destination: T, with modifier: ((any View) -> any View)? = nil) {
        let wrappedModifier = modifier.map { m in
            AnyViewModifier { content in
                AnyView(m(content))
            }
        } ?? AnyViewModifier.identity
        let wrappedDestination = RoutableWrapper(wrapped: destination, modifier: wrappedModifier)
        (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedPath.append(wrappedDestination)
    }
    
    /// Presents the specified item as a sheet or full-screen cover with an optional modifier.
    /// - Parameters:
    ///   - item: The item to present.
    ///   - type: The presentation type (sheet or full-screen cover).
    ///   - onDismiss: A closure to execute when the view is dismissed.
    ///   - modifier: A closure to modify the view.
    public static func present(
        _ item: T,
        as type: PresentationType,
        onDismiss: (() -> Void)? = nil,
        with modifier: ((any View) -> any View)? = nil
    ) {
        let wrappedModifier = modifier.map { m in
            AnyViewModifier { content in
                AnyView(m(content))
            }
        } ?? AnyViewModifier.identity
        let wrappedItem = RoutableWrapper(wrapped: item, modifier: wrappedModifier)
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        switch type {
        case .sheet:
            coordinator.typedSheet = wrappedItem
        case .fullScreenCover:
            coordinator.typedFullScreenCover = wrappedItem
        }
        
        coordinator.onDismiss = onDismiss
    }
    
    /// Dismisses the currently presented item or the top-most route.
    public static func dismiss() {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if coordinator.typedFullScreenCover != nil {
            coordinator.typedFullScreenCover = nil
        } else if coordinator.typedSheet != nil {
            coordinator.typedSheet = nil
        } else {
            _ = coordinator.typedPath.popLast()
        }
    }
    
    /// Dismisses the currently presented item or the top-most route.
    /// - Returns: The dismissed item or route, if any.
    public static func pop() -> T? {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if let fullScreenCover = coordinator.typedFullScreenCover {
            coordinator.typedFullScreenCover = nil
            return fullScreenCover.wrapped
        } else if let sheet = coordinator.typedSheet {
            coordinator.typedSheet = nil
            return sheet.wrapped
        } else {
            return coordinator.typedPath.popLast()?.wrapped
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
    public static func popToFirst(_ route: T) {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if let index = coordinator.typedPath.firstIndex(where: { $0.wrapped == route }) {
            coordinator.typedPath = Array(coordinator.typedPath.prefix(through: index))
        } else {
            print("Error: Route not found in the path")
        }
    }
    
    /// Pops all routes until the specified route is reached.
    /// - Parameter route: The route to pop to.
    /// - Note: Prints an error if the specified route is not found in the path.
    public static func popToLast(_ route: T) {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        if let index = coordinator.typedPath.lastIndex(where: { $0.wrapped == route }) {
            coordinator.typedPath = Array(coordinator.typedPath.prefix(through: index))
        } else {
            print("Error: Route not found in the path")
        }
    }
    
    /// Returns the top-most route without removing it from the stack. If the value does not exist, returns root.
    /// - Returns: The top-most route, if any. Else returns root.
    public static func peek() -> T? {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        return coordinator.typedPath.last?.wrapped ?? coordinator.typedRoot?.wrapped
    }
}
#endif
