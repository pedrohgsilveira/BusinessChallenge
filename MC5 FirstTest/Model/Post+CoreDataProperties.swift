//
//  Post+CoreDataProperties.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var date: String?
    @NSManaged public var id: Int32
    @NSManaged public var poster: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var channel: Channel?

}
