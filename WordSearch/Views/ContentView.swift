//
//  ContentView.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        NavigationView{
            TabView{
                SearchView()
                    .tabItem{
                        Image(systemName: "list.dash")
                        Text("Search")
                }
                SavedListView()
                    .tabItem{
                        Image(systemName: "folder")
                        Text("Saved")
                }
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
