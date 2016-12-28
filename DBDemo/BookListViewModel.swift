//
//  BookViewModel.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

struct BookListViewModel {
    
    private var books: Array<Book>
    private var user: User?
    
    init(books: Array<Book>, user: User?) {
        self.books = books
        self.user = user
    }
    
    mutating func setBooks(_ newBooks: Array<Book>) {
        books = newBooks
    }
    
    func bookCount() -> Int {
        return books.count
    }
    
    func bookAtIndex(_ index: Int) -> Book {
        return books[index]
    }
    
    func userInfo() -> (name: String, count: String) {
        return (name: user?.name ?? "", count: "\(books.count) 本")
    }
    
}
