//
//  Routable.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
public protocol Routable: Identifiable, Hashable {
    associatedtype Body : View
    @ViewBuilder var view: Self.Body { get }
}

public extension Routable where Self: Hashable {
    var id: Self { self }
}

struct RoutableWrapper<T: Routable>: Identifiable, Hashable {
    let id = UUID()
    let wrapped: T
    let modifier: AnyViewModifier
    
    static func ==(lhs: RoutableWrapper<T>, rhs: RoutableWrapper<T>) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
#endif
