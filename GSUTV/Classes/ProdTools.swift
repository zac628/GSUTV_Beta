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
    
    static let instance = ProdTools()
    let db: Connection?
    
    init() {
        _ = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("/Users/Zach/Projects/GSUTV_Swift/GSUTV/GSUTV/GSUTVdb.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
            
        }
    }
    
    func addProd(iname: String, idate: String, ilocation: String, inotes: String, icode: String) -> Int64? {
        do {
            let insert = Productions.insert(name <- iname, date <- idate, location <- ilocation, notes <- inotes, code <- icode)
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
                    notes: prod[notes]))
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
        do {
            for prod in try db!.prepare(self.Productions) {
                Productions.append(Production(
                    code: prod[code],
                    name: prod[name]!,
                    date: prod[date],
                    location: prod[location],
                    notes: prod[notes]))
            }
             for item in Productions{
                temp.append(item.name)
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
}
