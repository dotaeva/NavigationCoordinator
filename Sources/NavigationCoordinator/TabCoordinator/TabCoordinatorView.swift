//
//  TabCoordinatorView.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
fileprivate struct TabCoordinatorRootView<T: TabRoutable>: View {
    @StateObject var coordinator: TabCoordinator<T>
    @State private var selection: T?

    var body: some View {
        TabView(selection: $selection) {
            ForEach(coordinator.typedTabs, id: \.self) { tab in
                tab.view
                    .tabItem {
                        tab.tabItemView
                    }
                    .tag(tab)
            }
        }
        .onChange(of: selection) { newValue in
            coordinator.typedSelectedTab = newValue
        }
        .onAppear {
            selection = coordinator.typedSelectedTab ?? coordinator.typedTabs.first
        }
    }
}

extension TabCoordinator {
    /// Creates a view with all cases of the `TabRoutable` enum.
    /// - Returns: A view displaying the tabs.
    public static func view() -> some View {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as TabCoordinator<T>
        coordinator.typedTabs = Array(T.allCases)
        return TabCoordinatorRootView(coordinator: coordinator)
    }
}
#endif
