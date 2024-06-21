//
//  TabRoutable.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import SwiftUI

#if os(iOS)
public protocol TabRoutable: Routable, CaseIterable where AllCases: RandomAccessCollection {
    @ViewBuilder var tabItemView: Self.Body { get }
}
#endif
