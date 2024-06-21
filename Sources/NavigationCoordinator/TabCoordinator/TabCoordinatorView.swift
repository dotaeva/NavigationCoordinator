//
//  TabCoordinatorView.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
fileprivate struct TabCoordinatorRootView<T: TabRoutable>: View {
    @StateObject private var coordinator = CoordinatorManager.coordinator(for: T.self) as TabCoordinator<T>
    
    init() {
        let coordinator = CoordinatorManager.coordinator(for: T.self) as TabCoordinator<T>
        coordinator.typedTabs = Array(T.allCases)
    }
    
    var body: some View {
        TabView(selection: $coordinator.typedSelectedTab) {
            ForEach(coordinator.typedTabs, id: \.self) { tab in
                tab.view
                    .tabItem {
                        tab.tabItemView
                    }
                    .tag(tab)
            }
        }
    }
}

extension TabCoordinator {
    /// Creates a view with all cases of the `TabRoutable` enum.
    /// - Returns: A view displaying the tabs.
    public static func view() -> some View {
        TabCoordinatorRootView<T>()
    }
}
#endif
