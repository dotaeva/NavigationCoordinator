//
//  HomeView.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

class HomeEnvironment: ObservableObject {
    @Published var message: String = "Hello world!"
}

struct HomeView: View {
    @StateObject var homeEnv = HomeEnvironment()
    
    var body: some View {
        List {
            Section("Route") {
                Button("Push count") {
                    AppCoordinator.route(to: .count(0))
                }
                
                Button("Push detail") {
                    AppCoordinator.route(to: .detail) { view in
                        view
                            .environmentObject(homeEnv)
                    }
                }
            }
            
            Section("Modal") {
                Button("Sheet (Large)") {
                    AppCoordinator.present(.detail, as: .sheet, onDismiss: onDismiss) { view in
                        view
                            .environmentObject(homeEnv)
                    }
                }
                
                Button("Sheet (Medium)") {
                    AppCoordinator.present(.count(0), as: .sheet, onDismiss: onDismiss) { view in
                        view
                            .presentationDetents([.medium])
                    }
                }
                
                Button("Fullscreen Cover") {
                    AppCoordinator.present(.count(0), as: .fullScreenCover, onDismiss: onDismiss)
                }
            }
            
            Section("Utility") {
                Button("Peek") {
                    print("Peek: \(String(describing: AppCoordinator.peek()))")
                }
            }
        }
        .navigationTitle("Root")
    }
}

#Preview {
    HomeView()
}
