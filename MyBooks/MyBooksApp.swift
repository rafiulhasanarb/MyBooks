//
//  MyBooksApp.swift
//  MyBooks
//
//  Created by Rafiul Hasan on 10/30/24.
//

import SwiftUI
import SwiftData

@main
struct MyBooksApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
    
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
