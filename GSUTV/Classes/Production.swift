//
//  Production.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import Foundation

class Production {
    var code: String
    var name: String
    var date: String
    var location: String
    var notes: String
    var positions: Int64
    var camera: Int64
    var director: Int64
    var producer: Int64
    var audio: Int64
    var dit: Int64
    var pa: Int64
    var grip: Int64
    
    init(code: String, name: String, date: String, location: String, notes: String, positions: Int64){
        self.code = code
        self.name = name
        self.date = date
        self.location = location
        self.notes = notes
        self.positions = positions
        camera = 0
        director = 0
        producer = 0
        audio = 0
        dit = 0
        pa = 0
        grip = 0
    }
}
