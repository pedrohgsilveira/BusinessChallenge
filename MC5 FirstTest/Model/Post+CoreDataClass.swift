//
//  Post+CoreDataClass.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Post)
public class Post: NSManagedObject {

    func feed(id: Int32, date: String, poster: String, title: String, body: String, isActive: Bool, tags: String, isModified: Bool) {
        self.id = id
        self.date = date
        self.poster = poster
        self.title = title
        self.body = body
        self.isActive = isActive
        self.tags = tags
        self.isModified = isModified
    }
    
    func modifyData(newTitle: String?, newBody: String?) -> Bool{
        
        var existModification: Bool = false
        
        if let newTitle = newTitle {
            if newTitle != title {
                title = newTitle
                existModification = true
            }
        }
        
        if let newBody = newBody {
            if newBody != body {
                body = newBody
                existModification = true
            }
        }
        
        return existModification
    }
    
}
