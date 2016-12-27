//
//  BookViewModel.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

struct BookViewModel {
    
    func books() -> Array<Book> {
        var books = Array<Book>()
        
        for index in 1...5 {
            let book = Book()
            book.name = "book-\(index)"
            book.author = "author-\(index)"
            book.status = "可借"
            
            books.append(book)
        }
        
        return books
    }
    
}
