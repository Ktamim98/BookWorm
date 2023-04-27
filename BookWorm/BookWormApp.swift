//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Tamim Khan on 27/4/23.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.conteiner.viewContext)
        }
    }
}
