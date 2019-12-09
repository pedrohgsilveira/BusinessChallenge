//
//  Channel+CoreDataClass.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Channel)
public class Channel: NSManagedObject {

    func feed(id: Int32, name: String) {
        self.id = id
        self.name = name
    }
    
}
