//
//  ExampleApp.swift
//  Example
//
//  Created by Alexandr Valíček on 22.06.2024.
//

import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            AppTabCoordinator.view()
        }
    }
}

func onDismiss() {
    print("onDismiss")
}
