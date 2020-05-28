//
//  CartCell.swift
//  KangSayur
//
//  Created by Salicca Dewi Rahajeng on 19/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

@objc protocol CartCellDelegate{
    @objc optional func stepperTap()
}

class CartCell: UITableViewCell {

    @IBOutlet weak var imgGambarBarang: UIImageView!
    @IBOutlet weak var lblNamaBarang: UILabel!
    @IBOutlet weak var lblHargaBarang: UILabel!
    
    @IBOutlet weak var lblJumlah: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    weak var delegate: CartCellDelegate?
    
    var stepperAction: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.stepper?.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lblJumlah.text = Int(sender.value).description
        stepperAction?()
//        if(stepper.value == 0){
//            lblJumlah.text = "Hapus barang"
//        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
