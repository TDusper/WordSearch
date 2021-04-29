//
//  Word.swift
//  WordSearch
//
//  Created by user186139 on 4/28/21.
//  Copyright © 2021 user186139. All rights reserved.
//

import Foundation

struct Word: Codable{
    let metadata: Metadata
    let query: String
    let results: Array<Word>
}
