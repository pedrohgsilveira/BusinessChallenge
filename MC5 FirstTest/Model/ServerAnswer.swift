//
//  ServerAnswer.swift
//  MC5 FirstTest
//
//  Created by Edgar Sgroi on 09/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

public struct ServerAnswer<T:Codable>: Codable {
    var success: Bool?
    var msg: String?
    var content: T?
}
