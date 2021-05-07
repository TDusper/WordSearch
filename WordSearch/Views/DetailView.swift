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

struct DetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var word: WordItem
    @State var definition: String = ""
    @State var examples: String = ""
    @State var sound: String = ""
    @State var author: String = ""
    
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Group{
                    Text(word.word)
                    Text("Definition")
                    Text(word.definition)
                    Text("Examples")
                    Text(word.example)
                    Text("Sound Examples")
                    ForEach(word.sound_urls, id: \.self){sound in
                        Text(sound)
                    }
                    Text("Author")
                    Text(word.author)
                }
                VStack{
                    Text(word.permalink)
                    Text(word.written_on)
                    
                    HStack{
                        Text(String(word.thumbs_up))
                        Image(systemName: "hand.thumbsup.fill")
                        
                        Button("Save"){
                            let savedword = SavedWord(context: self.managedObjectContext)
                            savedword.author = self.word.author
                            savedword.defid = Int16(self.word.defid)
                            savedword.definition = self.word.definition
                            savedword.example = self.word.example
                            savedword.permalink = self.word.permalink
                            savedword.thumbsDown = Int16(self.word.thumbs_down)
                            savedword.thumbsUp = Int16(self.word.thumbs_up)
                            savedword.word = self.word.word
                            savedword.writtenOn = self.word.written_on
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                // handle the Core Data error
                            }
                        }
                        Image(systemName: "hand.thumbsdown.fill")
                        Text(String(word.thumbs_down))
                    }            }                .navigationBarTitle("Word Search")
                
                
                
                
            }
            
        }
    }
}


