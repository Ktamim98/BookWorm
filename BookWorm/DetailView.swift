//
//  DetailView.swift
//  BookWorm
//
//  Created by Tamim Khan on 27/4/23.
//
import CoreData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "unknown author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "no review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "unknown BOOK")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book", isPresented: $showingDeleteAlert){
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancle", role: .cancel) {}
        }message: {
            Text("are you sure?")
        }
        .toolbar{
            Button{
                showingDeleteAlert = true
            }label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook(){
        moc.delete(book)
        
        try? moc.save()
        
        dismiss()
    }
}

