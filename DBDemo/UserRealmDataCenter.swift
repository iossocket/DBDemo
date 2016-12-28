//
//  UserRealmDataCenter.swift
//  DBDemo
//
//  Created by Jianing Zheng on 12/28/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//
import Foundation
import RealmSwift

struct UserRealmDataCenter: UserDataCenter {
    
    func fetchUser() -> User? {
        let realm = try! Realm()
        guard let user = realm.objects(RealmUser.self).first else {
            return nil
        }
        return User(id: user.id, name: user.name)
    }
    
    func saveUserToDB() {
        let realmUser = RealmUser(value: ["id": 0, "name": "用户名"])
        
        DispatchQueue.global().async {
            let realm = try! Realm()
            try! realm.write {
                realm.add(realmUser)
            }
        }
    }
}
