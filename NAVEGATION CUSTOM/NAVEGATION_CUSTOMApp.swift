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

/*
 
 //Presentación
 PageSheet: Sólo es hasta una parte
 OverFullScreen: Toda la pantalla
 OverCurrentContext
 FormSheet: Solo hasta una parte
 CurrentContext: Aparece en toda la pantalla
 
 
 *Like: CurrentContext o FullScreen con Flip horizontal
 CurrentContext with CrossDisolve para que aparezca toda la pantalla
 CurrentContext with CovertVertical. Para que aparezca toda la pantalla desde a bajo hacia arriba y cubra toda la pantalla
 
 
 
 
 */
