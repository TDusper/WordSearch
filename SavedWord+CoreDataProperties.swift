//
//  SavedWord+CoreDataProperties.swift
//  WordSearch
//
//  Created by user186139 on 5/7/21.
//  Copyright © 2021 user186139. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedWord> {
        return NSFetchRequest<SavedWord>(entityName: "SavedWord")
    }

    @NSManaged public var author: String
    @NSManaged public var defid: Int32
    @NSManaged public var definition: String
    @NSManaged public var example: String
    @NSManaged public var permalink: String
    @NSManaged public var soundUrls: NSObject
    @NSManaged public var thumbsDown: Int32
    @NSManaged public var thumbsUp: Int32
    @NSManaged public var word: String
    @NSManaged public var writtenOn: String

}
