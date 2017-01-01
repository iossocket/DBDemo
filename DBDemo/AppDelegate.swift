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
    let bookDataService = RealmBookDataService(transform: RealmBookToBookTransform())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Prepare data in DB (temp)
      
        let books = bookDataService.fetchBooksFromBD()
        if books.count == 0 {
            bookDataService.saveBooksToDB()
        }
        
        let userDataCenter: UserDataService = RealmUserDataService()
        let user = userDataCenter.fetchUser()
        if user == nil {
            userDataCenter.saveUserToDB()
        }
        
        return true
    }
}

