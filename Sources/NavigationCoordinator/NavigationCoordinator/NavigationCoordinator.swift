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
    
    internal var typedRoot: RoutableWrapper<T>? {
        get { super.root as? RoutableWrapper<T> }
        set { super.root = newValue }
    }

    internal var typedPath: [RoutableWrapper<T>] {
        get { super.path.compactMap { $0 as? RoutableWrapper<T> } }
        set { super.path = newValue }
    }

    internal var typedFullScreenCover: RoutableWrapper<T>? {
        get { super.fullScreenCover as? RoutableWrapper<T> }
        set { super.fullScreenCover = newValue }
    }

    internal var typedSheet: RoutableWrapper<T>? {
        get { super.sheet as? RoutableWrapper<T> }
        set { super.sheet = newValue }
    }
    
    internal var onDismiss: (() -> Void)? = nil
}

extension NavigationCoordinator {
    /// Gets the current navigation path.
    /// - Returns: An array representing the current path of type `[T]`.
    public static var path: [T] {
        (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedPath.map { $0.wrapped }
    }
    
    /// Gets the current sheet.
    /// - Returns: The current sheet of type `T?`.
    public static var sheet: T? {
        (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedSheet?.wrapped
    }
    
    /// Gets the current full-screen cover.
    /// - Returns: The current full-screen cover of type `T?`.
    public static var fullScreenCover: T? {
        (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedFullScreenCover?.wrapped
    }
    
    /// Gets or sets the root of the coordinator.
    /// - Returns: The root of type `T`.
    public static var root: T? {
        get {
            (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedRoot?.wrapped
        }
        set {
            (CoordinatorManager.coordinator(for: T.self) as NavigationCoordinator<T>).typedRoot = newValue.map {
                RoutableWrapper(wrapped: $0, modifier: AnyViewModifier.identity)
            }
        }
    }
}
#endif
