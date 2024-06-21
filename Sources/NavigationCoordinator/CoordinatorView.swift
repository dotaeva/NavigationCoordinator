//
//  CoordinatorView.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
fileprivate struct CoordinatorRootView<T: Routable>: View {
    @StateObject var coordinator: Coordinator<T>
    
    var body: some View {
        NavigationStack(path: $coordinator.typedPath) {
            coordinator.root?.view
                .navigationDestination(for: T.self) { destination in
                    destination.view
                }
                .sheet(item: $coordinator.typedSheet) { item in
                    item.view
                }
                .fullScreenCover(item: $coordinator.typedFullScreenCover) { item in
                    item.view
                }
        }
    }
}

extension Coordinator {
    /// Creates a view with the specified root.
    /// - Parameter root: The root view to set.
    /// - Returns: A view displaying the root.
    public static func view(root: T) -> some View {
        let coordinator = CoordinatorManager.coordinator(for: T.self)
        coordinator.root = root
        return CoordinatorRootView(coordinator: coordinator)
    }
}
#endif
