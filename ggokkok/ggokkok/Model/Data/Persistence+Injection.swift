//
//  Persistence+Injection.swift
//  GgokKok
//
//  Created by sei on 2023/07/31.
//

import CoreData

/// id: UUID
/// insulinType: Int16
/// doses: Int32
/// site: Int16
/// timestamp: Date

extension PersistenceController {
    func addInjection(doses: Int, insulinType: InsulinType, site: Int, time: Date) {
        let context = container.viewContext
        ///        context.perform { 얘랑 무슨 차이?
        context.performAndWait {
            let injection = Injection(context: context)
            injection.id = UUID()
            setted(injection, doses: doses, insulinType: insulinType, site: site, time: time)
            context.save(with: .addInjection)
        }
    }

    func delete(injection: Injection) {
        /// delete 로직
        let context = container.viewContext
        context.delete(injection)
        context.save(with: .deleteInjection)
    }

    func update(doses: Int, insulinType: InsulinType, site: Int, time: Date, to injection: Injection) {
        if let context = injection.managedObjectContext {
            context.performAndWait {
                setted(injection, doses: doses, insulinType: insulinType, site: site, time: time)
                context.save(with: .updateInjection)
            }
        }
    }

    private func setted(_ injection: Injection, doses: Int, insulinType: InsulinType, site: Int, time: Date) {
        injection.wrappedDoses = doses
        injection.wrappedInsulinType = insulinType
        injection.wrappedSite = site
        injection.timestamp = time
    }

    // TODO: - 아래의 computed property는 추후 필요 없으면 삭제하자
    var injections: [Injection] {
        let injectionRequest: NSFetchRequest<Injection> = Injection.fetchRequest()
        injectionRequest.sortDescriptors = [.byTimestamp(ascending: false)]
        return (try? container.viewContext.fetch(injectionRequest)) ?? []
    }

    var onePositionInjection: Injection {
        let newInjection = Injection(context: container.viewContext)
        setted(newInjection, doses: 8, insulinType: .rapidActing, site: 1, time: Date())

        let injectionRequest: NSFetchRequest<Injection> = Injection.fetchRequest()
        injectionRequest.predicate = .injected(at: 1)
        injectionRequest.sortDescriptors = [.byTimestamp(ascending: false)]
        return (try? container.viewContext.fetch(injectionRequest).first) ?? newInjection
    }
}
