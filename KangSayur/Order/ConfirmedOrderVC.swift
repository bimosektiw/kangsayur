//
//  ConfirmedOrderVC.swift
//  KangSayur
//
//  Created by Salicca Dewi Rahajeng on 26/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class ConfirmedOrderVC: UIViewController {

    @IBOutlet weak var btnKembaliKeLangganan: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnKembaliKeLanggananClicked(_ sender: UIButton) {
        print("masuj")
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
//        self.insta
        
        let storyboard = UIStoryboard(name: "Subscribe", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "subsVC") as UIViewController
        present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subsSegue",
        let destination = segue.destination as? SubscribeVC
        {
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
