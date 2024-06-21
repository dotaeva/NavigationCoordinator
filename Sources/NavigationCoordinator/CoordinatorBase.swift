//
//  CoordinatorBase.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 21.06.2024.
//

import Foundation

#if os(iOS)
public class CoordinatorBase: ObservableObject {
    @Published public var root: AnyHashable?
    @Published public var path: [AnyHashable] = []
    @Published public var fullScreenCover: AnyHashable?
    @Published public var sheet: AnyHashable?
    
    @Published public var tabs: [AnyHashable] = []
    @Published public var selectedTab: AnyHashable?

    required public init() { }
}
#endif
