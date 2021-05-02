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
    @ObservedObject private var apiHandler = ApiHandler()
    private var data: [WordItem] {
        apiHandler.data?.list ?? []
    }
    
    var body: some View {
        NavigationView{
            VStack{
            TextField("Search", text: $apiHandler.searchText)
            List {
                ForEach(data) { entry in
                    NavigationLink(destination: DetailView()) {
                    // existing contents…

                        Text(entry.word)
                                    }
                 
                }
            }                .navigationBarTitle("Word Search")
            }
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
