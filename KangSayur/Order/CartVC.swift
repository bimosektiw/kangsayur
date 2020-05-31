//
//  CartVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit
import SwiftUI

class CartVC: UIViewController {

    @IBOutlet weak var cartTable: UITableView!
    
    @IBOutlet weak var imageTukangSayur: UIImageView!
    @IBOutlet weak var lblTukangSayur: UILabel!
    @IBOutlet weak var lblDaerahOperasi: UILabel!
    @IBOutlet weak var lblNoTelp: UILabel!
    @IBOutlet weak var lblTotalHarga: UILabel!
    @IBOutlet weak var btnPesan: UIButton!
    
    //dummy data
    var dummyDataInCart = [Product(productName: "Terong", productPrice: 10000, productImage: UIImage(named: "image1")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0, productIndexInCart: 02), Product(productName: "Timun", productPrice: 10400, productImage: UIImage(named: "image2")!, productCategory: "Sayuran", productStock: 12, productSatuan: "buah", productBuy: 0, productIndexInCart: 0)]
    
    
//    var itemorderedd = [Product]()
    var totalPrice: Int = 0
    
    var tempTotalPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cartTable.dataSource = self
        self.cartTable.delegate = self
        setupView()
        initialCalculation()
        
        imageTukangSayur.roundImage()
        
        dummyDataInCart = Testttt().getItemOrdered()
        // Do any additional setup after loading the view.
        
        //dari hubert
        let decimal: Decimal = Decimal(totalPrice)
        let decimalFormatted = decimal.formattedWithSeparator
        lblTotalHarga.text = "Rp. " + decimalFormatted
        
        //cek lagi
        lblTukangSayur.text = Testttt().getPedagangSelected().name
        lblNoTelp.text = Testttt().getPedagangSelected().phone
        lblDaerahOperasi.text = Testttt().getPedagangSelected().address
    }
    
        func initialCalculation (){
            for productPrice in dummyDataInCart {
                if (productPrice.productBuy != 0) {
                    tempTotalPrice = productPrice.productBuy * productPrice.productPrice;
                }
                totalPrice += tempTotalPrice
            }
        }

    func setupView(){
        let nib = UINib(nibName: "CartCell", bundle: nil)
        cartTable.register(nib, forCellReuseIdentifier: "cartCell")
    }
    
    @IBAction func btnPesanClicked(_ sender: UIButton) {
        if (lblTotalHarga.isEqual(0)){
            showWarningEmptyCart()
        }
        else{
          performSegue(withIdentifier: "toConfirmedOrder", sender: self)
        }
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource, CartCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //nanti diganti dari data yang diambil dari listitem
        return dummyDataInCart.count
//        return Testttt().getItemOrdered().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartCell
        cell.delegate = self
        cell.stepperAction = {
            if (cell.stepper.value == 0){
                self.showWarningDelete(index: indexPath.row)
            }else {
                self.dummyDataInCart[indexPath.row].productBuy = Int(cell.stepper.value)
                tableView.reloadData()
            }
            self.totalHarga()
        }
        
        //masukin data ke cell
        let itemList = dummyDataInCart[indexPath.row]
//        let itemList = Testttt().getItemOrdered()[indexPath.row]
        cell.imgGambarBarang?.image = itemList.productImage
        cell.lblNamaBarang?.text = itemList.productName
        cell.lblHargaBarang?.text = "Rp. " + String(itemList.productPrice) + " / " + itemList.productSatuan
        cell.lblJumlah?.text = String(itemList.productBuy)
        
        //atur stepper
        
        
        cell.stepper.value = Double(itemList.productBuy)
        cell.stepper.wraps = false
        cell.stepper.autorepeat = true
        cell.stepper.maximumValue = Double(itemList.productStock)
        //cell.stepper.minimumValue = 1
        
        return cell
    }
    
    func totalHarga(){
        var total = 0 //
        for i in 0..<dummyDataInCart.count {
            let totalHargaSatuBarang = dummyDataInCart[i].productBuy * dummyDataInCart[i].productPrice
            total += totalHargaSatuBarang
        }
        let decimal: Decimal = Decimal(total)
        let decimalFormatted = decimal.formattedWithSeparator
        lblTotalHarga.text = "Rp. " + String(decimalFormatted)
    }
    
    
    public func showWarningDelete(index: Int){
        let alert = UIAlertController(title: "Hapus Barang", message: "Apakah anda yakin mau menghapus barang ini?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ya", style: .default, handler: { action in
            self.dummyDataInCart.remove(at: index)
            self.cartTable.reloadData()
            //ngurangin harga pas data diapus
            self.totalHarga()
            //self.totalPrice = totalPrice - dummyDataInCart.productPrice
        }))
        alert.addAction(UIAlertAction(title: "Tidak", style: .cancel, handler: nil))
        
        
        self.present(alert, animated: true)
    }
    
    func showWarningEmptyCart(){
        let alert = UIAlertController(title: "Cart Anda Kosong", message: "Silahkan kembali", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ya", style: .default, handler: nil))
    }
}

extension UIImageView{
    func roundImage(){
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
