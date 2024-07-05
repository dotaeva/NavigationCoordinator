//
//  TabCoordinator.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
public class TabCoordinator<T: TabRoutable>: CoordinatorBase {
    required init() {
        super.init()
    }
    
    internal var typedTabs: [T] {
        get { super.tabs.compactMap { $0 as? T } }
        set { super.tabs = newValue }
    }
    
    internal var typedSelectedTab: T? {
        get { super.selectedTab as? T }
        set { super.selectedTab = newValue }
    }
}

extension TabCoordinator {
    /// Returns current tabs.
    /// - Returns: An array representing the current tabs of type [T].
    public static var tabs: [T] {
        get {
            (CoordinatorManager.coordinator(for: T.self) as TabCoordinator<T>).typedTabs
        }
    }
    
    /// Selects a specific tab.
    /// - Parameter tab: The tab to select.
    public static func select(tab: T) {
        (CoordinatorManager.coordinator(for: T.self) as TabCoordinator<T>).typedSelectedTab = tab
    }
    
    /// Returns the selected tab.
    /// - Returns: The currently selected tab of type T.
    public static var selectedTab: T? {
        (CoordinatorManager.coordinator(for: T.self) as TabCoordinator<T>).typedSelectedTab
    }
}
#endif
