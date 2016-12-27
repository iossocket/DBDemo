//
//  RealmBook.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/27/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import Foundation
import RealmSwift

class RealmBook: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var author = ""
    dynamic var status = false
}
