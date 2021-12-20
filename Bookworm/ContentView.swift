//
//  ContentView.swift
//  Bookworm
//
//  Created by Sergey Dolgikh on 11.12.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        
        NavigationView {
            Text("Count book: \(books.count)")
                .navigationTitle("Boockworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                        
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
