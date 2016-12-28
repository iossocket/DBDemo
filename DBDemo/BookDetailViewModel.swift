//
//  BookDetailViewModel.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/28/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

struct BookDetailViewModel {
    
    let book: Book
    
    func bookID() -> Int {
        return book.id
    }
    
    func name() -> String {
        return book.name
    }
    
    func author() -> String {
        return book.author
    }
    
    func status() -> String {
        return book.displayedStatus
    }
    
}
