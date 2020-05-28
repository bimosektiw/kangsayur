//
//  ProfileVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, CanReceive   {
    @IBOutlet weak var profileSection: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    func passDataBack(name: String, address: String, phone: String, email: String, password: String) {
        nameLabel.text = name
        addressLabel.text = address
        phoneLabel.text = phone
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileSection.layer.cornerRadius = 22
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "editingSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editingSegue" {
            let editVC = segue.destination as! EditProfileVC
            editVC.delegate = self
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
