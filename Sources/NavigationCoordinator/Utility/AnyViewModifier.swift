//
//  AnyViewModifier.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 24.06.2024.
//

import SwiftUI

struct AnyViewModifier: ViewModifier {
    let modify: (AnyView) -> AnyView

    func body(content: Content) -> some View {
        modify(AnyView(content))
    }

    static var identity: AnyViewModifier {
        AnyViewModifier { $0 }
    }
}
