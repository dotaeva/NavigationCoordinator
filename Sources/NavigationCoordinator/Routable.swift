//
//  Routable.swift
//  ExampleCoordinatorApp
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
#endif
