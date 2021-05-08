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
        List(words) { entry in
            NavigationLink(destination: SavedDetailView(word: entry)) {
            Text("\(entry.word)")
            }
        }
  }
}
