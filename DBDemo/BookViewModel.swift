//
//  BookViewModel.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

struct BookViewModel {
    
    let bookDataCenter = BookDataCenter()
    
    func books() -> Array<Book> {
        return bookDataCenter.fetchBooksFromBD()
    }
    
    func fetchBookById(_ id: Int) -> (name: String, author: String, status: String) {
        let fetchedBook = bookDataCenter.fetchBookById(id)
        
        guard let book = fetchedBook else {
            return (name: "", author: "", status: "")
        }
        
        return (name: book.name, author: book.author, status: book.displayedStatus)
    }
    
    func changeBookStatus(_ id: Int, successHandler:@escaping (_ book: Book) -> Void) {
        bookDataCenter.changeBookStatus(id, successHandler: successHandler)
    }
    
}
