//
//  ProfileView.swift
//  ExampleCoordinatorApp
//
//  Created by Alexandr Valíček on 22.06.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section("Tab") {
                Button("Go to Home") {
                    withAnimation {
                        AppTabCoordinator.select(tab: .home)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
