//
//  ServerManager.swift
//  MC5 FirstTest
//
//  Created by Edgar Sgroi on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import Foundation

public enum Endpoint: String {
    case test = "test"
}

public class ServerManager {
    
    var canais: [Channel] = []
    var posts: [Post] = []
}
