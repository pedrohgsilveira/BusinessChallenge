//
//  Admin+CoreDataProperties.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//
//

import Foundation
import CoreData


extension Admin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Admin> {
        return NSFetchRequest<Admin>(entityName: "Admin")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var password: String?

}
