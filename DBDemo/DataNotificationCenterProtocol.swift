//
//  BookNotificationCenterProtocol.swift
//  DBDemo
//
//  Created by Jian Zhang on 1/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

protocol BookNotificationCenter {
    func register(deletionHandler: ((_ books: [Book], _ deletions: [Int])->())?,
                  insertionHandler: ((_ books: [Book], _ insertions: [Int])->())?,
                  modificationHandler: ((_ books: [Book], _ modifications: [Int])->())?)
}
