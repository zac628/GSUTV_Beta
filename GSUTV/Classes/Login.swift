//
//  Login.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import Foundation
import SQLite

class Login{
    let Users = Table("Users")
    let id = Expression<Int64>("id")
    let username = Expression<String?>("username")
    let password = Expression<String>("password")
    
    static let instance = Login()
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
    
    func addUser(uname: String, upass: String) -> Int64? {
        do {
            let insert = Users.insert(username <- uname, password <- upass )
            let id = try db!.run(insert)
            
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    
    func getUsers() -> [User] {
        var Users = [User]()
        do {
            for user in try db!.prepare(self.Users) {
                Users.append(User(
                    id: user[id],
                    username: user[username]!,
                    password: user[password]))
            }
            /*for item in Users{
                print(item.username)
            }*/
        } catch {
            print("Select failed")
        }
        return Users
    }
    
    func check(uname: String,upass: String) -> Bool{
        let creds = getUsers()
        for user in creds{
            if(uname == user.username && upass == user.password){
                return true
            }
        }
        return false
    }
}
