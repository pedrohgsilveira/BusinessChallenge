//
//  AplicationNotifications.swift
//  MC5 FirstTest
//
//  Created by Pedro Henrique Guedes Silveira on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import Foundation
import UIKit


class AplicationNotifications{
    var identifier:String
    var actions:[(title:String, action:() -> Void, appReOpens:Bool)]?
    
    
    init(identifier:String, actions:[(title:String, action:() -> Void, appReOpens:Bool)]?) {
        self.identifier = identifier
        self.actions = actions
    }
}
