//
//  CartVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var imageTukangSayur: UIImageView!
    @IBOutlet weak var lblTukangSayur: UILabel!
    @IBOutlet weak var lblDaerahOperasi: UILabel!
    @IBOutlet weak var lblNoTelp: UILabel!
    @IBOutlet weak var lblTotalHarga: UILabel!
    @IBOutlet weak var btnPesan: UIButton!
    
    
    
    
//    var itemorderedd = [Product]()
    var totalPrice: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let decimal: Decimal = Decimal(totalPrice)
        let decimalFormatted = decimal.formattedWithSeparator
        lblTotalHarga.text = "Rp. " + decimalFormatted
        lblTukangSayur.text = Testttt().getPedagangSelected().name
        lblNoTelp.text = Testttt().getPedagangSelected().phone
        lblDaerahOperasi.text = Testttt().getPedagangSelected().address
    }

    
    @IBAction func btnPesanClicked(_ sender: UIButton) {
        
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Testttt().getItemOrdered().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableCell", for: indexPath)
        
        return cell
    }
    
    
}
