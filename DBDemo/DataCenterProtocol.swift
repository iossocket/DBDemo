//
//  UserDataCenter.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/28/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

protocol UserDataCenter {
    func fetchUser() -> User?
    func saveUserToDB()
}

protocol BookDataCenter {
    mutating func fetchBooksFromBD(notificationHandler: ((_ type: NotificationType) -> Void)?) -> Array<Book>
    func fetchBookById(_ id: Int) -> Book?
    func changeBookStatus(_ id: Int, successHandler: @escaping (_ book: Book) -> Void)
    func saveBooksToDB()
}
