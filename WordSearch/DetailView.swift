//
//  DetailView.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var word: WordItem
    @State var definition: String = ""
    @State var examples: String = ""
    @State var sound: String = ""



    var body: some View {
        VStack{
            Group{
                Text(word.word)
            Text("Definition")
                TextField(word.definition, text: $definition)
            Text("Examples")
                TextField(word.example, text: $examples)
            Text("Sound Examples")
                ForEach(word.sound_urls, id: \.self){sound in
                    TextField(sound, text: self.$sound)
                    }
            }
       

            
            
        }
    }
}


