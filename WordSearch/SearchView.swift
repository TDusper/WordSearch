//
//  SearchView.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import Foundation
import SwiftUI
struct SearchView: View {
    
    var planets = ["Mercury", "Venus", "Earth", "Mars"]
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("WordSearch", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                ForEach(
                 
                    planets.filter {
                        searchText.isEmpty ||
                        $0.localizedStandardContains(searchText)
                    },
                    id: \.self
                ) { eachPlanet in
                    NavigationLink(destination: DetailView()) {
    // existing contents…

                    Text(eachPlanet)
                    }
                }
            }
                .navigationBarTitle("Planets")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
