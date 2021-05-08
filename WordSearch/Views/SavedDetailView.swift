//
//  DetailView.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import SwiftUI
import CoreData
import Foundation

struct SavedDetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var word: SavedWord
   
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Group{
                    Text(word.word)
                    Text("Definition")
                    Text(word.definition)
                    Text("Examples")
                    Text(word.example)
                  
                    Text("Author")
                    Text(word.author)
                }
                VStack{
                    Text(word.permalink)
                    Text(word.writtenOn)
                    
                    HStack{
                        Text(String(word.thumbsUp))
                        Image(systemName: "hand.thumbsup.fill")
                        Image(systemName: "hand.thumbsdown.fill")
                        Text(String(word.thumbsDown))
                    }            }                .navigationBarTitle("Word Search")
                
                
                
                
            }
            
        }
    }
}


