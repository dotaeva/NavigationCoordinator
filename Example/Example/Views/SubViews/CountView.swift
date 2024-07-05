//
//  CountView.swift
//  NavigationCoordinator
//
//  Created by Alexandr Valíček on 20.06.2024.
//

import SwiftUI

struct CountView: View {
    let number: Int
    
    var body: some View {
        List {
            Section("Route") {
                Button("Push count") {
                    AppCoordinator.route(to: .count(number + 1))
                }
                
                Button("Push detail") {
                    AppCoordinator.route(to: .detail)
                }
            }
            
            Section("Modal") {
                Button("Sheet (Large)") {
                    AppCoordinator.present(.count(0), as: .sheet, onDismiss: onDismiss)
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
                
                Button("Pop") {
                    print("Popped: \(String(describing: AppCoordinator.pop()))")
                }
                
                Button("Pop To Root") {
                    AppCoordinator.popToRoot()
                }
                
                Button("Pop To Last Detail") {
                    AppCoordinator.popToLast(.detail)
                }
            }
        }
        .navigationTitle("Count \(number)")
    }
}

#Preview {
    CountView(number: 1)
}
