//
//  RealmBookNotificaitonCenter.swift
//  DBDemo
//
//  Created by Jian Zhang on 1/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RealmSwift

class RealmBookNotificaitonCenter: BookNotificationCenter {
    private let transform: RealmBookToBookTransform
    
    private var notificationTokens = [NotificationToken]()
    
    init(transform: RealmBookToBookTransform) {
        self.transform = transform
    }
    
    func register(deletionHandler: (([Book], [Int]) -> ())?, insertionHandler: (([Book], [Int]) -> ())?, modificationHandler: (([Book], [Int]) -> ())?) {
        let realm = try! Realm()
        let results = realm.objects(RealmBook.self)
        let notificationToken = results.addNotificationBlock { [weak self] changes in
            guard let strongSelf = self else {
                // TODO: thorw a error
                return
            }
            switch changes {
            case .update(let value, let deletions, let insertions, let modifications):
                let books = strongSelf.transform.mapResults(value)
                deletionHandler?(books, deletions)
                insertionHandler?(books, insertions)
                modificationHandler?(books, modifications)
                break
            default:
                break
            }
        }
        notificationTokens.append(notificationToken)
    }
}
