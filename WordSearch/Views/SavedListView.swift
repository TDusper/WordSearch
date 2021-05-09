//
//  SavedListView.swift
//  WordSearch
//
//  Created by user186139 on 5/6/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import SwiftUI

struct SavedListView: View {
    let persistenceController = PersistenceController.shared
  
     @Environment(\.managedObjectContext) var managedObjectContext
     @FetchRequest(entity: SavedWord.entity(), sortDescriptors: [])

    var words: FetchedResults<SavedWord>

    var body: some View {
         List {
                       ForEach(words) { entry in
                           NavigationLink(destination: SavedDetailView(word: entry)) {
                               // existing contents…
                               
                               Text(entry.word)
                           }
                           
            }.onDelete(perform: delete)
                   }                .navigationBarTitle("Word Search")
  }
       func delete(at offsets: IndexSet) {
    for offset in offsets {
        // find this book in our fetch request
        let entry = words[offset]

        // delete it from the context
        managedObjectContext.delete(entry)
    }

    // save the context
    try? managedObjectContext.save()
}
    }


