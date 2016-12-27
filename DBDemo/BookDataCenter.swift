//
//  BookDataCenter.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//


import Foundation
import RealmSwift

struct BookDataCenter {

    var realm: Realm!

    func fetchBooksFromBD() -> Array<Book> {
        let realm = try! Realm()
        
        print("--------------")
        print(realm.configuration.fileURL!.path)
                
        return Array(realm.objects(RealmBook.self)).map {
            Book(name: $0.name, author: $0.author, status: $0.status)
        }
    }
    
    func saveBooksToDB() {
        for index in 1...5 {
            let realmBook = RealmBook(value: ["name": "book-\(index)", "author": "author-\(index)", "status": "可借"])
            saveBook(realmBook)
        }
    }
    
    func saveBook(_ book: RealmBook) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            try! realm.write {
                realm.add(book)
            }
        }
    }

}
