//
//  NotURLProtocol.swift
//  MC5 FirstTest
//
//  Created by Edgar Sgroi on 06/12/19.
//  Copyright © 2019 Pedro Henrique Guedes Silveira. All rights reserved.
//

import Foundation

protocol MyErrorProtocol: LocalizedError {
    var title: String? { get }
}

struct NotURLError: MyErrorProtocol {
    var title: String?
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }

    private var _description: String

    init(title: String?, description: String) {
        self.title = title ?? "Invalid parse to URL"
        self._description = description
    }
}
