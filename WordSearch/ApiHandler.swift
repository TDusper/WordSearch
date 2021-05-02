//
//  APIHandler.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import Combine
import Foundation

class ApiHandler: ObservableObject {
    let appId = "mashape-community-urban-dictionary.p.rapidapi.com"
    let appKey = "b761cc5fc2msh502ba40f25e4418p1f3f2bjsnfe77bd7e8fa1"
    let language = "en-gb"
    @Published var searchText = "programmer"
    @Published private(set) var data: WordList? = nil
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        retrieveData(keyword: searchText)
    }
    
    func retrieveData(keyword: String) {
        guard let url = URL(string: "https://mashape-community-urban-dictionary.p.rapidapi.com/define?term=\(keyword)") else {
            return
        }
        
        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "x-rapidapi-host")
        request.addValue(appKey, forHTTPHeaderField: "x-rapidapi-key")
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { $0.data }
            .decode(type: WordList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.data = $0 })
            .store(in: &cancellable)

    }
}

