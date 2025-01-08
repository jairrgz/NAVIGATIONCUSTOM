//
//  NAVEGATION_CUSTOMApp.swift
//  NAVEGATION CUSTOM
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 7/01/25.
//

import SwiftUI

@main
struct NAVEGATION_CUSTOMApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//                FirstView()
//                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
//                Divider()
//                ViewControllerRepresentable()
            ViewControllerTwoRepresentable()
        }
    }
}
