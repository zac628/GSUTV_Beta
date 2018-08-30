//
//  User.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import Foundation

class User {
    let id: Int64?
    var username: String
    var password: String
    
    init(id: Int64) {
        self.id = id
        username = ""
        password = ""
    }
    
    init(id: Int64, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
    
}

