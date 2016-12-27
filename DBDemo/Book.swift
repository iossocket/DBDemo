//
//  Book.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

enum BookStatus: String {
    case available = "Available"
    case nonAvailable = "Not Available"
}

struct Book {
    let id: Int
    let name: String
    let author: String
    let status: Bool
}

extension Book {
    var displayedStatus: String {
        return status ? "Available" : "Not Available"
    }
}
