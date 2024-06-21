//
//  TabRoutable.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
public protocol TabRoutable: Routable, CaseIterable where AllCases: RandomAccessCollection {
    associatedtype TabItemBody : View
    @ViewBuilder var tabItemView: Self.TabItemBody { get }
}
#endif
