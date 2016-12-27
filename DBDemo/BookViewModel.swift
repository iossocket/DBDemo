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
        
}
