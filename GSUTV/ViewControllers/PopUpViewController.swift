//
//  PopUpViewController.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {


    @IBOutlet weak var UIprodid: UITextField!
    
    @IBAction func UIpidbtn(_ sender: Any) {
        if(ProdTools().updateProduction(ccode: "temp", newCode: UIprodid.text!) == true){
            performSegue(withIdentifier: "segueCreatePositions", sender: nil)
        }else{
            print("fail")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
