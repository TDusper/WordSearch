//
//  APIHandler.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
    let appId = ""
    let appKey = ""
    let language = "en-gb"
    
    
    @Published private(set) var data: Word? = nil
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        retrieveData(keyword: "swimming")
    }
    
    func retrieveData(keyword: String) {
        guard let url = URL(string: "https://od-api.oxforddictionaries.com/api/v2/words/en-gb?q=\(keyword)&fields=definitions%2Cetymologies%2Cexamples%2CvariantForms") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: Word.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.data = $0 })
            .store(in: &cancellable)
        
        
    }
}

