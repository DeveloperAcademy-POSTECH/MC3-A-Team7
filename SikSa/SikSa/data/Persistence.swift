//
//  Persistence.swift
//  SikSa
//
//  Created by chaekie on 2023/07/10.
//

import CoreData
import OSLog

class PersistenceController {
    let logger = Logger(subsystem: "com.example.SikSa", category: "persistence")

    static let shared = PersistenceController()

    var lastUpdatedInjection: Injection?

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for position in 1...10 {
            let newInjection = Injection(context: viewContext)
            newInjection.timestamp = Date() - position
            newInjection.position = Int16(position)
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate.
            // You should not use this function in a shipping application,
            // although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SikSa")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                // You should not use this function in a shipping application,
                // although it may be useful during development.

                /* Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible,
                 *   due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true

        if injections.count == 0 {
            Task {
                try await fetchInjections()
            }
        }
    }
}

extension PersistenceController {
    var fileName: String { "pre-injections" }
    var fileExtension: String { "json" }

    private func fetchInjections() async throws {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            return
        }
        do {
            let data = try Data(contentsOf: fileUrl)
            // Decode the GeoJSON into a data model.
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .secondsSince1970
            let injectionPropertiesList = try jsonDecoder.decode([InjectionProperties].self, from: data)
            logger.debug("Received \(injectionPropertiesList.count) records.")

            // Import the GeoJSON into Core Data.
            logger.debug("Start importing data to the store...")
            try await importInjections(from: injectionPropertiesList)
            logger.debug("Finished importing data.")

            container.viewContext.refreshAllObjects()
        } catch {
            throw InjectionError.wrongDataFormat(error: error)
        }
    }
}

extension PersistenceController {

    /// Uses `NSBatchInsertRequest` (BIR) to import a JSON dictionary into the Core Data store on a private queue.
    private func importInjections(from propertiesList: [InjectionProperties]) async throws {
        guard !propertiesList.isEmpty else { return }

        let context = container.viewContext
        /// - Tag: performAndWait
        try await context.perform {
            // Execute the batch insert.
            /// - Tag: batchInsertRequest
            let batchInsertRequest = self.newBatchInsertRequest(with: propertiesList)

            if let fetchInjectionResult = try? context.execute(batchInsertRequest),
               let batchInjectionInsertResult = fetchInjectionResult as? NSBatchInsertResult,
               let successInjection = batchInjectionInsertResult.result as? Bool,
               successInjection {
                return
            }

            self.logger.debug("Failed to execute batch insert request.")
            throw InjectionError.batchInsertError
        }

        logger.debug("Successfully inserted data.")
    }

    private func newBatchInsertRequest(with propertyList: [InjectionProperties]) -> NSBatchInsertRequest {
        var index = 0
        let total = propertyList.count

        // Provide one dictionary at a time when the closure is called.
        let batchInsertRequest = NSBatchInsertRequest(entity: Injection.entity(), dictionaryHandler: { dictionary in
            guard index < total else { return true }
            dictionary.addEntries(from: propertyList[index].dictionaryValue)
            index += 1
            return false
        })
        return batchInsertRequest
    }
}
