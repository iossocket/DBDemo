//
//  BookViewModel.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

struct BookListViewModel {
    
    let bookDataCenter: BookDataCenter
    let books: Array<Book>
    
    init(bookDataCenter: BookDataCenter) {
        self.bookDataCenter = bookDataCenter
        self.books = bookDataCenter.fetchBooksFromBD()
    }
    
    func bookCount() -> Int {
        return books.count
    }
    
    func bookAtIndex(_ index: Int) -> Book {
        return books[index]
    }
    
}