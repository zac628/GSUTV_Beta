//
//  CreateProductionVC.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/30/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import UIKit

class CreateProductionVC: UIViewController {

    @IBOutlet weak var UIprodname: UITextField!
    @IBOutlet weak var UIdate: UIDatePicker!
    @IBOutlet weak var UIlocation: UITextField!
    @IBOutlet weak var UInotes: UITextView!
    
    
    @IBAction func DontBtn(_ sender: Any) {
        ProdTools().addProd(iname: UIprodname.text!, idate: UIdate.date.description, ilocation: UIlocation.text!, inotes: UInotes.text!, icode: "temp")
        
        let popUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProdIdPopUp") as! PopUpViewController
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
