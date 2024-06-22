//
//  PresentationType.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

#if os(iOS)
public enum PresentationType {
    case sheet(_ detents: [PresentationDetent] = [.large])
    case fullScreenCover
}
#endif
