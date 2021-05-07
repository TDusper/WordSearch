import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example programming languages.
       for _ in 0..<10 {
        let newWord = SavedWord()
        newWord.author = "Dus"
        newWord.defid = 0
        newWord.definition = "This is a definition"
        newWord.example = "This is an example"
        newWord.permalink = "This is a link"
        newWord.thumbsDown = 0
        newWord.thumbsUp = 0
        newWord.word = "This is a word"
        newWord.writtenOn = "Written date"
        }
        return controller
    }()
    
    
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "DataModel")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}


      
