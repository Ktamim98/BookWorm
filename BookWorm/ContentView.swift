//
//  ContentView.swift
//  BookWorm
//
//  Created by Tamim Khan on 27/4/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    
    
    @State private var showingAddScreen = false
  
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink{
                        DetailView(book: book)
                    }label: {
                        HStack(){
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown Title")
                                    .foregroundColor(book.rating < 2 ? .red : .primary)
                                    .font(.headline)
                                Text(book.author ?? "Unknown Aithor")
                                    .foregroundColor(.secondary)
                               
                            }
                            Spacer()
                            EmojiRatingView(rating: book.rating)
                          
                      
                           
                        }
                    }
                    
                }
                .onDelete(perform: deleteBooks)
            }
                .navigationTitle("Bookworm")
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showingAddScreen.toggle()
                        }label: {
                            Label("add book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddBookView()
                }
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
