//
//  AddBookView.swift
//  BookWorm
//
//  Created by Tamim Khan on 27/4/23.
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
    
 
    
    var hasValid: Bool{
            if title.isEmpty || author.isEmpty{
                return false
            }
            return true
        }
    
    let genres = ["Fantasy", "Horror", "Kids", "Thriller", "Poetry", "Mystery", "Romance"]
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    
                    Picker("Select Genre", selection: $genre){
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section{
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }header: {
                    Text("Write a review")
                }
                Section{
                    Button("Save"){
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        
                            
                        try? moc.save()
                        dismiss()
                    }
                    .disabled(hasValid == false)
                    
                }
            }
            .navigationTitle("Add Book")
            
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
