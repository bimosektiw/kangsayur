//
//  ListItemViewController.swift
//  KangSayur
//
//  Created by Hubert Daryanto on 15/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {
    var products = [Product(productName: "Terong", productPrice: 10000, productImage: UIImage(named: "image1")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0, productIndexInCart: 0), Product(productName: "Timun", productPrice: 10400, productImage: UIImage(named: "image2")!, productCategory: "Sayuran", productStock: 12, productSatuan: "buah", productBuy: 0, productIndexInCart: 0), Product(productName: "Ikan Salmon", productPrice: 30000, productImage: UIImage(named: "image3")!, productCategory: "Ikan", productStock: 10, productSatuan: "fillet", productBuy: 0, productIndexInCart: 0), Product(productName: "Pepaya", productPrice: 12000, productImage: UIImage(named: "image4")!, productCategory: "Buah", productStock: 3, productSatuan: "buah", productBuy: 0, productIndexInCart: 0), Product(productName: "Daun Pepaya", productPrice: 10400, productImage: UIImage(named: "image5")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0, productIndexInCart: 0), Product(productName: "Bawang Merah", productPrice: 10000, productImage: UIImage(named: "image6")!, productCategory: "Bumbu", productStock: 2000, productSatuan: "gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Bawang Putih", productPrice: 8000, productImage: UIImage(named: "image7")!, productCategory: "Bumbu", productStock: 1000, productSatuan: "gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Tahu Putih", productPrice: 10000, productImage: UIImage(named: "image8")!, productCategory: "Lauk", productStock: 20, productSatuan: "pcs", productBuy: 0, productIndexInCart: 0), Product(productName: "Tempe Kotak 250gr", productPrice: 6000, productImage: UIImage(named: "image9")!, productCategory: "Lauk", productStock: 30, productSatuan: "pcs", productBuy: 0, productIndexInCart: 0), Product(productName: "Brocoly", productPrice: 5000, productImage: UIImage(named: "image10")!, productCategory: "Sayuran", productStock: 15, productSatuan: "x100 gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Buncis", productPrice: 5000, productImage: UIImage(named: "image11")!, productCategory: "Sayuran", productStock: 10, productSatuan: "ikat", productBuy: 0, productIndexInCart: 0), Product(productName: "Tomat", productPrice: 3000, productImage: UIImage(named: "image12")!, productCategory: "Sayuran", productStock: 13, productSatuan: "buah", productBuy: 0, productIndexInCart: 0), Product(productName: "Pisang", productPrice: 16000, productImage: UIImage(named: "image13")!, productCategory: "Buah", productStock: 5, productSatuan: "kg", productBuy: 0, productIndexInCart: 0), Product(productName: "Udang", productPrice: 8000, productImage: UIImage(named: "image14")!, productCategory: "Seafood", productStock: 20, productSatuan: "gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Royco Kaldu Ayam", productPrice: 3000, productImage: UIImage(named: "image15")!, productCategory: "Bumbu", productStock: 25, productSatuan: "sachet", productBuy: 0, productIndexInCart: 0), Product(productName: "Terong", productPrice: 10000, productImage: UIImage(named: "image1")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0, productIndexInCart: 0), Product(productName: "Timun", productPrice: 10400, productImage: UIImage(named: "image2")!, productCategory: "Sayuran", productStock: 12, productSatuan: "buah", productBuy: 0, productIndexInCart: 0), Product(productName: "Ikan Salmon", productPrice: 30000, productImage: UIImage(named: "image3")!, productCategory: "Ikan", productStock: 10, productSatuan: "fillet", productBuy: 0, productIndexInCart: 0), Product(productName: "Pepaya", productPrice: 12000, productImage: UIImage(named: "image4")!, productCategory: "Buah", productStock: 3, productSatuan: "buah", productBuy: 0, productIndexInCart: 0), Product(productName: "Daun Pepaya", productPrice: 10400, productImage: UIImage(named: "image5")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0, productIndexInCart: 0), Product(productName: "Bawang Merah", productPrice: 10000, productImage: UIImage(named: "image6")!, productCategory: "Bumbu", productStock: 2000, productSatuan: "gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Bawang Putih", productPrice: 8000, productImage: UIImage(named: "image7")!, productCategory: "Bumbu", productStock: 1000, productSatuan: "gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Tahu", productPrice: 10000, productImage: UIImage(named: "image8")!, productCategory: "Lauk", productStock: 20, productSatuan: "pcs", productBuy: 0, productIndexInCart: 0), Product(productName: "Tempe Kotak Besar", productPrice: 15000, productImage: UIImage(named: "image9")!, productCategory: "Lauk", productStock: 30, productSatuan: "pcs", productBuy: 0, productIndexInCart: 0), Product(productName: "Brocoly", productPrice: 5000, productImage: UIImage(named: "image10")!, productCategory: "Sayuran", productStock: 15, productSatuan: "x100 gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Buncis", productPrice: 5000, productImage: UIImage(named: "image11")!, productCategory: "Sayuran", productStock: 10, productSatuan: "ikat", productBuy: 0, productIndexInCart: 0), Product(productName: "Tomat", productPrice: 3000, productImage: UIImage(named: "image12")!, productCategory: "Sayuran", productStock: 13, productSatuan: "buah", productBuy: 0, productIndexInCart: 0), Product(productName: "Pisang", productPrice: 16000, productImage: UIImage(named: "image13")!, productCategory: "Buah", productStock: 5, productSatuan: "kg", productBuy: 0, productIndexInCart: 0), Product(productName: "Udang", productPrice: 8000, productImage: UIImage(named: "image14")!, productCategory: "Seafood", productStock: 20, productSatuan: "gr", productBuy: 0, productIndexInCart: 0), Product(productName: "Royco Kaldu Ayam", productPrice: 3000, productImage: UIImage(named: "image15")!, productCategory: "Bumbu", productStock: 25, productSatuan: "sachet", productBuy: 0, productIndexInCart: 0)]
    var dummydata: [Product] = []
    @IBOutlet weak var namaPedagangLabel: UILabel!
    var namapedagang: String = "3"
    @IBOutlet weak var buttonSymbol: UIImageView!
    @IBOutlet weak var labelTotalBarang: UILabel!
    @IBOutlet weak var labelTotalHargaBarang: UILabel!
    @IBOutlet weak var btnView: UIView!
    var totalCost: Int = 0
    var totalItem: Int = 0
    var totalIndexInCart: Int = 0
    var itemordered: [Product] = []
    
    //Var lemparan dari venus
    var namaLemparan = String()
    
    @IBOutlet weak var toCartBtn: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        switch Testttt().getPedagangSelected().name {
        case "Bu Sumringah":
            for i in 0...5{
                dummydata.append(products[i])
            }
        case "Pak Jojon":
            for i in 6...11{
                dummydata.append(products[i])
            }
            
        case "Mas Siul":
            for i in 12...17{
                dummydata.append(products[i])
            }
        case "Mbak Iyem":
            for i in 18...23{
                dummydata.append(products[i])
            }
            
        case "Bu Brewok":
            for i in 24...29{
                dummydata.append(products[i])
            }
        default:
            for i in 0...5{
                dummydata.append(products[i])
            }
        }
        
        collectionView.register(ProductCell.nib(), forCellWithReuseIdentifier: "ProductCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        namaPedagangLabel.text = "Dagangan\n" + Testttt().getPedagangSelected().name
        buttonSymbol.image = UIImage.init(named: "Cart")
        btnView.isHidden = true
        
        
        
        //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        //
        //        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //        //tap.cancelsTouchesInView = false
        //
        //        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    //Calls this function when the tap is recognized.
    //    @objc func dismissKeyboard() {
    //        //Causes the view (or one of its embedded text fields) to resign the first responder status.
    //        view.endEditing(true)
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func goToCartView(_ sender: Any) {
        //literally ini masih bug karena cuman nge load item yang keliatan doang...
//        let fetch = collectionView.indexPathsForVisibleItems
//        itemordered = []
//        for index in fetch
//        {
//            if dummydata[index.row].productBuy >= 1 {
//                itemordered.append(dummydata[index.row])
//            }
//        }
        //        performSegue(withIdentifier: "cartVC", sender: itemordered)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cartVC = segue.destination as? CartVC {
            //            cartVC.itemorderedd = self.itemordered
            Testttt().setItemOrdered(data: self.itemordered)
            cartVC.totalPrice = self.totalCost
        }
    }
    
}


extension ListItemViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummydata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = dummydata[indexPath.row]
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell)
        cell.productName.text = product.productName
        cell.productImage.image = product.productImage
        let decimal: Decimal = Decimal(product.productPrice)
        let decimalFormatted = decimal.formattedWithSeparator
        cell.productPrice.text = "Rp. " + decimalFormatted + "/" + product.productSatuan
        cell.productStock.text = "Stok: " + String(product.productStock) + " " + product.productSatuan
        cell.productCategory.text = product.productCategory
        
        cell.buyQty.text = String(product.productBuy) +  " " + product.productSatuan
        dummydata[indexPath.row].productBuy = product.productBuy
        print(dummydata[indexPath.row].productBuy)
        
        cell.btnTapMinusAction.tag = indexPath.row
        cell.btnTapMinusAction.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        cell.btnTapPlusAction.tag = indexPath.row
        cell.btnTapPlusAction.addTarget(self, action: #selector(buttonAction2(_:)), for: .touchUpInside)
        return cell
    }
    
    //note = jumlah productbuy belum masuk ke CartVC
    @objc func buttonAction(_ sender: UIButton){//terpanggil kalau kurangin item
        let index = sender.tag
        let indexPathArray = IndexPath(item: index, section: 0)
        if dummydata[index].productBuy >= 1{
            dummydata[index].productBuy = dummydata[index].productBuy - 1
            totalCost = totalCost - dummydata[index].productPrice
            if totalItem == 1 {
                btnView.isHidden = true
            }
            totalItem = totalItem - 1
            itemordered[dummydata[index].productIndexInCart].productBuy = dummydata[index].productBuy
            if dummydata[index].productBuy == 0{
                itemordered.remove(at: dummydata[index].productIndexInCart)
                for data in 0...dummydata.count - 1
                {
                    if dummydata[data].productIndexInCart > dummydata[index].productIndexInCart {
                        dummydata[data].productIndexInCart = dummydata[data].productIndexInCart - 1
                    }
                }
                totalIndexInCart = totalIndexInCart - 1
            }
            
            let decimal: Decimal = Decimal(totalCost)
            let decimalFormatted = decimal.formattedWithSeparator
            labelTotalBarang.text = String(totalItem) + " Barang"
            labelTotalHargaBarang.text = "Rp. " + decimalFormatted
        }
        
        collectionView.reloadItems(at: [indexPathArray])
    }
    
    @objc func buttonAction2(_ sender: UIButton){//terpanggil kalau tambah item
        let index = sender.tag
        let indexPathArray = IndexPath(item: index, section: 0)
        if dummydata[index].productBuy == 0{
            itemordered.append(dummydata[index])
            dummydata[index].productIndexInCart = totalIndexInCart
            totalIndexInCart = totalIndexInCart + 1
        }
        if dummydata[index].productBuy < dummydata[index].productStock{
            dummydata[index].productBuy = dummydata[index].productBuy + 1
            totalCost = totalCost + dummydata[index].productPrice
            if totalItem == 0 {
                btnView.isHidden = false
            }
            totalItem = totalItem + 1
            itemordered[dummydata[index].productIndexInCart].productBuy = dummydata[index].productBuy
            let decimal: Decimal = Decimal(totalCost)
            let decimalFormatted = decimal.formattedWithSeparator
            labelTotalBarang.text = String(totalItem) + " Barang"
            labelTotalHargaBarang.text = "Rp. " + decimalFormatted
        }
        collectionView.reloadItems(at: [indexPathArray])
    }
}




