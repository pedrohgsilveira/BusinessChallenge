//
//  Channel+CoreDataProperties.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//
//

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var posts: NSSet?

}

// MARK: Generated accessors for posts
extension Channel {

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Post)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Post)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSSet)

}
