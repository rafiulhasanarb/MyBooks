//
//  NewBookView.swift
//  MyBooks
//
//  Created by Rafiul Hasan on 10/30/24.
//

import SwiftUI

struct NewBookView: View {
    
    //MARK: Local Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismisss
    @State private var title = ""
    @State private var author = ""
    
    //MARK: Body
    var body: some View {
        NavigationStack {
            Form {
                TextField("Book Title", text: $title)
                TextField("Author", text: $author)
                
                Button("Create") {
                    let newBook = Book(title: title, author: author)
                    context.insert(newBook)
                    dismisss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || author.isEmpty)
                .navigationTitle("New Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismisss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewBookView()
}
