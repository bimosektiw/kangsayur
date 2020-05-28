//
//  AddSubscribeCell.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 26/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

@objc protocol AddSubscribeCellDelegate: AnyObject {
    @objc optional func tapSubscribe()
}

class AddSubscribeCell: UITableViewCell {

    @IBOutlet weak var subscribeButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    weak var delegate: AddSubscribeCellDelegate?
    
    var subsButtonAction: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subscribeButton.addTarget(self, action: #selector(subsTapped(_:)), for: .touchUpInside)
        addressLabel.sizeToFit()
        profileImageView.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func subsTapped(_ sender: Any) {
        subsButtonAction?()
    }
}
