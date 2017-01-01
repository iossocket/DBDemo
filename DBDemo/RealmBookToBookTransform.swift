//
//  RealmBookToBookTransform.swift
//  DBDemo
//
//  Created by Jian Zhang on 1/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmBookToBookTransform {
    func mapResults(_ results: Results<RealmBook>) -> [Book] {
        return Array(results).map {
            Book(id: $0.id, name: $0.name, author: $0.author, status: $0.status)
        }
    }
}
