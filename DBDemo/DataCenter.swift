//
//  DataCenter.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/28/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation

protocol DataCenter {
    
    func fetchObjects<T: DBModel>(_ type: T.Type) -> Array<DBModel>
    func fetchObjects<T: DBModel>(_ type: T.Type, predictFormat: String) -> Array<DBModel>
    func saveObject(_ object: DBModel)
    
    func toggleBookStatus(id: Int, successHandler: @escaping (_ book: RealmBook) -> Void)
    
}
