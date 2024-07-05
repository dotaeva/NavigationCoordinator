//
//  AppTabCoordinator.swift
//  ExampleCoordinatorApp
//
//  Created by Alexandr Valíček on 22.06.2024.
//

import SwiftUI
import NavigationCoordinator

typealias AppTabCoordinator = TabCoordinator<TabDestination>

enum TabDestination: TabRoutable {
    case home
    case profile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            AppCoordinator.view(root: .home)
        case .profile:
            ProfileView()
        }
    }
    
    @ViewBuilder
    var tabItemView: some View {
        switch self {
        case .home:
            VStack {
                Image(systemName: "house")
                Text("Home")
            }
        case .profile:
            VStack {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}
