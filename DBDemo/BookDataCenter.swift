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
            Book(id: $0.id, name: $0.name, author: $0.author, status: $0.status)
        }
    }
    
    func fetchBookById(_ id: Int) -> Book? {
        let realm = try! Realm()
        
        let realmBook = realm.objects(RealmBook.self).filter("id = %@", id).first
        guard let book = realmBook else { return nil }
        
        return Book(id: book.id, name: book.name, author: book.author, status: book.status)
    }
    
    func saveBooksToDB() {
        for index in 1...5 {
            let realmBook = RealmBook(value: ["id": index, "name": "book-\(index)", "author": "author-\(index)", "status": false])
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
