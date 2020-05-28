//
//  CartCell.swift
//  KangSayur
//
//  Created by Salicca Dewi Rahajeng on 19/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit
import SwiftUI

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
    
    
//    var dummyDataInCart = [Product(productName: "Terong", productPrice: 10000, productImage: UIImage(named: "image1")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 2), Product(productName: "Timun", productPrice: 10400, productImage: UIImage(named: "image2")!, productCategory: "Sayuran", productStock: 12, productSatuan: "buah", productBuy: 1)]
//
//    var tempValue = 0;
//    var totalPrice = 0;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.stepper?.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .touchUpInside)
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperAction?()
        
//        self.tempValue = Int(sender.value)
        lblJumlah.text = Int(sender.value).description
        //updateResult()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
}
