//
//  RequestVC.swift
//  GSUTV
//
//  Created by Zachary Cox on 8/31/18.
//  Copyright © 2018 Zachary Cox. All rights reserved.
//

import UIKit

class RequestVC: UIViewController {
    @IBOutlet weak var txtCamera: UILabel!
    @IBOutlet weak var txtDirector: UILabel!
    @IBOutlet weak var txtProducer: UILabel!
    @IBOutlet weak var txtAudio: UILabel!
    @IBOutlet weak var txtDit: UILabel!
    @IBOutlet weak var txtPa: UILabel!
    @IBOutlet weak var txtGrip: UILabel!
    @IBOutlet weak var txtNameCode: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    
    var pos = [String]()
    var myString: String? = ""
    
    @IBAction func CameraBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    @IBAction func DirectorBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    @IBAction func ProducerBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    @IBAction func AudioBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    @IBAction func DitBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    @IBAction func PaBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    @IBAction func GripBtn(_ sender: Any) {
        let popDown = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PosSub") as! PopDownViewController
        self.addChildViewController(popDown)
        popDown.view.frame = self.view.frame
        self.view.addSubview(popDown.view)
        popDown.didMove(toParentViewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myString!)
        let del = "\""
        var new = myString?.components(separatedBy: del)
        print(new![0])
       // print(new![1])
        pos = ProdTools().getPositionStrings(cname: myString!)
        txtNameCode.text = pos[0] + " : " + pos[1]
        txtDate.text = pos[2]
        txtCamera.text = pos[3]
        txtDirector.text = pos[4]
        txtProducer.text = pos[5]
        txtAudio.text = pos[6]
        txtDit.text = pos[7]
        txtPa.text = pos[8]
        txtGrip.text = pos[9]
        
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
