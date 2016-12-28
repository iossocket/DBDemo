//
//  BookDetailViewModel.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/28/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

struct BookDetailViewModel {

    let bookDataCenter: BookDataCenter
    let bookID: Int

    func fetchBookFromDB() -> (name: String, author: String, status: String) {
        let fetchedBook = bookDataCenter.fetchBookById(bookID)
        
        guard let book = fetchedBook else {
            return (name: "", author: "", status: "")
        }
        
        return (name: book.name, author: book.author, status: book.displayedStatus)
    }
    
    func changeBookStatus(successHandler:@escaping (_ book: Book) -> Void) {
        bookDataCenter.changeBookStatus(bookID, successHandler: successHandler)
    }
}
