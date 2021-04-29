//
//  DetailView.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var etymologies: String = ""
    @State var inflections: String = ""
    @State var definitions: String = ""
    @State var examples: String = ""
    @State var synonyms: String = ""




    var body: some View {
        VStack{
            Group{
            Text("Hello, World!")
            Text("Etymologies:")
            TextField("Etymologies", text: $etymologies)
            Text("Inflections")
            TextField("Inflections", text: $inflections)
            Text("definitions")
            TextField("Definitions", text: $definitions)
            Text("Examples")
            TextField("Examples", text: $examples)
            }
            Text("Synonyms")
            TextField("Synonyms", text: $synonyms)
            Button(action: {}){Text("Save")}

            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
