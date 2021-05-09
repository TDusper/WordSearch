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
    @State var buttonText = "Save"
    
    
    
    var body: some View {
        NavigationView{
             ScrollView{
            VStack{
                Group{
                    Text(word.word.uppercased()).bold().padding()
                    Text("Definition")
                    Text(word.definition).padding()
                      

                    Text("Examples").padding(.top)
                    Text(word.example).padding()
                    HStack{
                    Text("Author: ")
                        Text(word.author)}
                }
                VStack{
                    HStack{
                    Text("Submitted: ")

                    Text(word.written_on)
                    }
                    HStack{
                        Text(String(word.thumbs_up)).padding()
                        Image(systemName: "hand.thumbsup.fill")
                        
                        Button(self.buttonText){
                            self.buttonText = "Saved"
                            self.disabled(true)
                            let savedword = SavedWord(context: self.managedObjectContext)
                            savedword.author = self.word.author
                            savedword.defid = Int64(self.word.defid)
                            savedword.definition = self.word.definition
                            savedword.example = self.word.example
                            savedword.permalink = self.word.permalink
                            savedword.thumbsDown = Int64(self.word.thumbs_down)
                            savedword.thumbsUp = Int64(self.word.thumbs_up)
                            savedword.word = self.word.word
                            savedword.writtenOn = self.word.written_on
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                // handle the Core Data error
                            }
                        }.padding()
                        Image(systemName: "hand.thumbsdown.fill")
                        Text(String(word.thumbs_down)).padding()
                    }            }                .navigationBarTitle("Word Search", displayMode: .inline)
                
                
            }
            }
            
        }
    }
}


