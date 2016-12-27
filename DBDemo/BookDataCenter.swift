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
        
        print("------realm path: --------")
        print(realm.configuration.fileURL!.path)
                
        return Array(realm.objects(RealmBook.self)).map {
            Book(id: $0.id, name: $0.name, author: $0.author, status: $0.status)
        }
    }
    
    func fetchBookById(_ id: Int) -> Book? {
        let realm = try! Realm()
        
        guard let bookInDB = realm.objects(RealmBook.self).filter("id = %@", id).first else {
            return nil
        }
        return bookModelFromRealmBook(bookInDB)
    }
    
    func changeBookStatus(_ id: Int, successHandler:@escaping (_ book: Book) -> Void) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            if let bookInDB = realm.objects(RealmBook.self).filter("id = %@", id).first {
                try! realm.write {
                    bookInDB.status = !bookInDB.status
                }
                
                let book = self.bookModelFromRealmBook(bookInDB)
                DispatchQueue.main.async {
                    successHandler(book)
                }
            }
        }
    }
    
    private func bookModelFromRealmBook(_ book: RealmBook) -> Book {
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
