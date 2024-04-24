//
//  Entity+CoreDataProperties.swift
//  FinanceApp
//
//  Created by Timur Inamkhojayev on 25.03.2024.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: String?
    @NSManaged public var sum: Int32
    @NSManaged public var descript: String?
    @NSManaged public var date: Date?

}

extension Entity : Identifiable {

}
