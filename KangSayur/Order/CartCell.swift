//
//  CartCell.swift
//  KangSayur
//
//  Created by Salicca Dewi Rahajeng on 19/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var lblJumlah: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stepper.wraps = false
        stepper.autorepeat = true
        //max value nanti diganti sesuai sm stock
        stepper.maximumValue = 10
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lblJumlah.text = Int(sender.value).description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
