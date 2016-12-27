//
//  AppDelegate.swift
//  DBDemo
//
//  Created by XueliangZhu on 12/19/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Prepare data in DB
        let bookDataCenter = BookDataCenter()
        let books = bookDataCenter.fetchBooksFromBD()
        if books.count == 0 {
            bookDataCenter.saveBooksToDB()
        }
        
        return true
    }
}

