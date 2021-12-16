//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Sergey Dolgikh on 11.12.2021.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            TextEditorView()
            ListStudents()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
