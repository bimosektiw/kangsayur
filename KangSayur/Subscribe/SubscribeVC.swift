//
//  SubscribeVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit
import CoreData

class SubscribeVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
        var pedagangArray: [Pedagang] = []
        
        @IBOutlet weak var tablePedagang: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tablePedagang.reloadData()
            
            tablePedagang.dataSource = self
            tablePedagang.delegate = self
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return  110
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pedagangArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "pedagangCell", for: indexPath) as! pedagangTableViewCell
            
            cell.pedagangNameLb?.text = pedagangArray[indexPath.row].name
            cell.pedagangAddressLb?.text = pedagangArray[indexPath.row].address
            cell.phone?.text = pedagangArray[indexPath.row].phone
            cell.photo.makeRounded()
            cell.photo?.image = #imageLiteral(resourceName: "Aerith-FFVII-Remake-1200x900")
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
                pedagangArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            return "Unsubscribe"
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "listSegue",
            let destination = segue.destination as? ListItemViewController,
            let Index = tablePedagang.indexPathForSelectedRow?.row
            {
                destination.namaLemparan = pedagangArray[Index].name
            }
        }
    }

    class pedagangTableViewCell: UITableViewCell {
        @IBOutlet weak var pedagangNameLb: UILabel!
        @IBOutlet weak var pedagangAddressLb: UILabel!
        @IBOutlet weak var phone: UILabel!
        @IBOutlet weak var photo: UIImageView!
    }

    extension UIImageView {
        func makeRounded() {

            self.layer.borderWidth = 1
            self.layer.masksToBounds = false
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
            self.contentMode = .scaleAspectFill
        }
    }

