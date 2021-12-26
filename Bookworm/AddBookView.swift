//
//  AddBookView.swift
//  Bookworm
//
//  Created by Sergey Dolgikh on 19.12.2021.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker ("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button ("Save") {
                        addNewBook()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

extension AddBookView {
    private func addNewBook() {
        let newBook = Book(context: moc)
        newBook.id = UUID()
        newBook.rating = Int16(rating)
        newBook.timestamp = Date.now
        
        newBook.title = title.isEmpty ? nil : title
        newBook.author = author.isEmpty ? nil : author
        newBook.review = review.isEmpty ? nil : review
        newBook.genre = genre.isEmpty ? nil : genre
      
        try? moc.save()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
