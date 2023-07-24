//
//  Persistence+Injection.swift
//  GGokKogg
//
//  Created by sei on 2023/07/18.
//

import CoreData

extension PersistenceController {
    func addInjection(time: Date, position: Int) {
        let context = container.viewContext
        ///        context.perform { 얘랑 무슨 차이?
        context.performAndWait {
            let injection = Injection(context: context)
            injection.id = Int64(UUID().hashValue)
            injection.timestamp = time
            injection.position = Int16(position)
            context.save(with: .addInjection)
        }
    }

    func delete(injection: Injection) {
        /// delete 로직
        let context = container.viewContext
        context.delete(injection)
        context.save(with: .deleteInjection)
    }

    func update(time: Date, position: Int, to injection: Injection) {
        if let context = injection.managedObjectContext {
            context.performAndWait {
                injection.timestamp = time
                injection.position = Int16(position)
                context.save(with: .updateInjection)
            }
        }
    }

    var injections: [Injection] {
        let injectionRequest: NSFetchRequest<Injection> = Injection.fetchRequest()
        injectionRequest.sortDescriptors = [.byTimestamp(ascending: false)]
        return (try? container.viewContext.fetch(injectionRequest)) ?? []
    }

    var onePositionInjection: Injection {
        var newInjection = Injection(context: container.viewContext)
        newInjection.timestamp = Date()
        newInjection.position = 1

        let injectionRequest: NSFetchRequest<Injection> = Injection.fetchRequest()
        injectionRequest.predicate = .injected(at: 1)
        injectionRequest.sortDescriptors = [.byTimestamp(ascending: false)]
        return (try? container.viewContext.fetch(injectionRequest).first) ?? newInjection

    }
}

