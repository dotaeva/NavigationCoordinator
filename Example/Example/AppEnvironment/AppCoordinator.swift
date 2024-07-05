//
//  Destination+View.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI
import NavigationCoordinator

typealias AppCoordinator = NavigationCoordinator<AppDestination>

enum AppDestination: Routable {
    case home
    case detail
    case count(Int)
}

extension AppDestination {
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        case .detail:
            DetailView()
        case .count(let i):
            CountView(number: i)
        }
    }
}
