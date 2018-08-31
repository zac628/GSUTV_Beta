//
//  Production.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import Foundation

class Production {
    let id: Int64?
    var code: String
    var name: String
    var date: String
    var location: String
    var notes: String
    
    init(id: Int64) {
        self.id = id
        code = ""
        name = ""
        date = ""
        location = ""
        notes = ""
    }
    
    init(id: Int64, code: String, name: String, date: String, location: String, notes: String) {
        self.id = id
        self.code = code
        self.name = name
        self.date = date
        self.location = location
        self.notes = notes
    }
    
}
