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
                    root.view
                } else {
                    EmptyView()
                }
            }
            .navigationDestination(for: T.self) { destination in
                destination.view
            }
            .sheet(item: $coordinator.typedSheet) { item in
                item.view
                    .presentationDetents(Set(coordinator.sheetDetents))
            }
            .fullScreenCover(item: $coordinator.typedFullScreenCover) { item in
                item.view
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
        coordinator.root = root
        return NavigationCoordinatorRootView(coordinator: coordinator)
    }
    
    /// Creates a view with the Coordinators' root.
    /// - Parameter root: The root view to set.
    /// - Returns: A view displaying the root.
    public static func view() -> some View {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>
        return NavigationCoordinatorRootView(coordinator: coordinator)
    }
}
#endif
