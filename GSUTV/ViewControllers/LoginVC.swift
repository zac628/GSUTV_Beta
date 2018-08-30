//
//  ViewController.swift
//  GSUTV
//
//  Created by Zachary Cox on 4/13/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import UIKit
import SQLite3

class LoginVC: UIViewController {
    
    @IBOutlet weak var UIuname: UITextField!
    @IBOutlet weak var UIupass: UITextField!
    @IBAction func LogginBtn(_ sender: Any) {
        //Login().createTable()
        let name: String = UIuname.text!
        let pass: String = UIupass.text!
        if(Login().check(uname: name, upass: pass)){
            performSegue(withIdentifier: "segueLoginLanding", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

