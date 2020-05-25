//
//  ProductCell.swift
//  KangSayur
//
//  Created by Hubert Daryanto on 14/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productStock: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    
    @IBOutlet weak var buyQty: UILabel!
    
    @IBOutlet weak var btnTapMinusAction: UIButton!
    @IBOutlet weak var btnTapPlusAction: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ProductCell", bundle: nil)
    }
}
