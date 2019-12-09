//
//  CoreDataStatus.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class CoreDataStatus{
    public private(set) var successful:Bool
    public private(set) var description:String
    public var channelIdentifier:Channel? 

    init(successful:Bool, description:String) {
        self.successful = successful
        self.description = description
    }

    convenience init(successful:Bool){
        self.init(successful:successful, description:"")
    }

}
