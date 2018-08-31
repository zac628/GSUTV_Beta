//
//  ProdTools.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import Foundation
import SQLite

class ProdTools{
    let Productions = Table("Productions")
    let id = Expression<Int64>("id")
    let code = Expression<String>("code")
    let name = Expression<String?>("name")
    let date = Expression<String>("date")
    let location = Expression<String>("location")
    let notes = Expression<String>("notes")
    let positions = Expression<Int64>("positions")
    let camera = Expression<Int64>("camera")
    let director = Expression<Int64>("director")
    let producer = Expression<Int64>("producer")
    let audio = Expression<Int64>("audio")
    let dit = Expression<Int64>("dit")
    let pa = Expression<Int64>("pa")
    let grip = Expression<Int64>("grip")
    
    let dateFormatterGet = DateFormatter()
    let dateFormatterPrint = DateFormatter()
    
    static let instance = ProdTools()
    let db: Connection?
    
    init() {
        _ = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("/Users/Zach/Projects/GSUTV_Swift/GSUTV/GSUTVdb.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
            
        }
    }
    
    func addProd(iname: String, idate: String, ilocation: String, inotes: String, icode: String, ipositions: Int64 ) -> Int64? {
        do {
            let insert = Productions.insert(name <- iname, date <- idate, location <- ilocation, notes <- inotes, code <- icode, positions <- -1)
            let id = try db!.run(insert)
            
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    func getProductions() -> [Production] {
        var Productions = [Production]()
        do {
            for prod in try db!.prepare(self.Productions) {
                Productions.append(Production(
                    code: prod[code],
                    name: prod[name]!,
                    date: prod[date],
                    location: prod[location],
                    notes: prod[notes],
                    positions: prod[positions]))
            }
            /*//TEST PRINT
             for item in Productions{
             print(item.name)
             }*/
        } catch {
            print("Select failed")
        }
        return Productions
    }
    
    func getProductionStrings() -> [String] {
        var Productions = [Production]()
        var temp = [String]()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        dateFormatterPrint.dateFormat = "MM/dd/yyyy HH:mm"
        
        do {
            for prod in try db!.prepare(self.Productions) {
                Productions.append(Production(
                    code: prod[code],
                    name: prod[name]!,
                    date: prod[date],
                    location: prod[location],
                    notes: prod[notes],
                    positions:prod[positions]))
            }
            var bleh = String()
             for item in Productions{
                if let date2 = dateFormatterGet.date(from: item.date){
                    bleh = dateFormatterPrint.string(from: date2)
                }
                else {
                    print("There was an error decoding the string")
                }
                temp.append(item.name + "  |  " + bleh + "  |   \(item.positions)")
             }
        } catch {
            print("Select failed")
        }
        return temp
    }
    
    func check(iname: String,iid: String) -> Bool{
        let creds = getProductions()
        for prod in creds{
            if(iname == prod.name && iid == prod.code){
                return true
            }
        }
        return false
    }
    func updateProduction(ccode: String, newCode: String) -> Bool {
        let prod = Productions.filter(code == ccode)
        do {
            let update = prod.update([
                code <- newCode
                ])
            if try db!.run(update) > 0 {
                print(update.asSQL())
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        return false
    }
    func updatePositions(cpositions: Int64, newPositions: Int64, newCamera: Int64, newDirector: Int64, newProducer: Int64, newAudio: Int64, newDit: Int64, newPa: Int64, newGrip: Int64) -> Bool {
        let prod = Productions.filter(positions == cpositions)
        do {
            let update = prod.update([
                positions <- newPositions,
                camera <- newCamera,
                director <- newDirector,
                producer <- newProducer,
                audio <- newAudio,
                dit <- newDit,
                pa <- newPa,
                grip <- newGrip
                ])
            if try db!.run(update) > 0 {
                print(update.asSQL())
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        return false
    }
}
