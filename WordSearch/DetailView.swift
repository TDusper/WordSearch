//
//  DetailView.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var definitions: String = ""
    @State var examples: String = ""




    var body: some View {
        VStack{
            Group{
            Text("Hello, World!")
            Text("definitions")
            TextField("Definitions", text: $definitions)
            Text("Examples")
            TextField("Examples", text: $examples)
            }
       

            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
