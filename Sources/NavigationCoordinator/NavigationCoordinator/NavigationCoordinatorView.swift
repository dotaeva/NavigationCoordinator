//
//  NavigationCoordinatorView.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
fileprivate struct NavigationCoordinatorRootView<T: Routable>: View {
    @StateObject var coordinator: NavigationCoordinator<T>
    
    var body: some View {
        NavigationStack(path: $coordinator.typedPath) {
            Group {
                if let root = coordinator.typedRoot {
                    root.wrapped.view.modifier(root.modifier)
                } else {
                    EmptyView()
                }
            }
            .navigationDestination(for: RoutableWrapper<T>.self) { destination in
                destination.wrapped.view.modifier(destination.modifier)
            }
            .sheet(item: $coordinator.typedSheet, onDismiss: coordinator.onDismiss) { item in
                item.wrapped.view.modifier(item.modifier)
            }
            .fullScreenCover(item: $coordinator.typedFullScreenCover, onDismiss: coordinator.onDismiss) { item in
                item.wrapped.view.modifier(item.modifier)
            }
        }
    }
}

extension NavigationCoordinator {
    /// Creates a view with the specified root.
    /// - Parameter root: The root view to set.
    /// - Returns: A view displaying the root.
    public static func view(root: T) -> some View {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        coordinator.typedRoot = RoutableWrapper(wrapped: root, modifier: AnyViewModifier.identity)
        return NavigationCoordinatorRootView(coordinator: coordinator)
    }
    
    /// Creates a view with the Coordinators' root.
    /// - Returns: A view displaying the root.
    public static func view() -> some View {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        return NavigationCoordinatorRootView(coordinator: coordinator)
    }
}
#endif
