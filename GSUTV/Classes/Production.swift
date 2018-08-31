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
    
    init(name: String, code: String, date: String, positions: Int64, camera: Int64, director:Int64, producer: Int64, audio: Int64, dit: Int64, pa: Int64, grip: Int64){
        self.code = code
        self.name = name
        self.date = date
        location = ""
        notes = ""
        self.positions = positions
        self.camera = camera
        self.director = director
        self.producer = producer
        self.audio = audio
        self.dit = dit
        self.pa = pa
        self.grip = grip
    }
}
