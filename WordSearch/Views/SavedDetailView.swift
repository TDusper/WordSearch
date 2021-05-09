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

                            Text(word.writtenOn)
                            }
                            HStack(){
                                Text(String(word.thumbsUp)).padding()
                                Image(systemName: "hand.thumbsup.fill")
                                
                                Button("Saved"){
                                    
                                }
                                .disabled(true)
                                .padding()
                                Image(systemName: "hand.thumbsdown.fill")
                                Text(String(word.thumbsDown)).padding()
                            }            }                .navigationBarTitle("Word Search", displayMode: .inline)
                        
                        
                    }
                    }
                    
                }
            }
        }

