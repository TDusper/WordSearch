//
//  Item.swift
//  WordSearch
//
//  Created by user186139 on 4/29/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import Foundation

struct WordList: Codable {
    let list: [WordItem]
}

struct WordItem: Codable {
    let definition: String
    let permalink: String
    let thumbs_up: Int
    let sound_urls: [String]
    let author: String
    let word: String
    let defid: Int
    let written_on: String // mozda ce ti trebati date parser
    let example: String
    let thumbs_down: Int
    
}
