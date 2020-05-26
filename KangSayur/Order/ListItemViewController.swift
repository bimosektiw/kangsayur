//
//  ListItemViewController.swift
//  KangSayur
//
//  Created by Hubert Daryanto on 15/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {
    var dummydata = [Product(productName: "Terong", productPrice: 10000, productImage: UIImage(named: "image1")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0), Product(productName: "Timun", productPrice: 10400, productImage: UIImage(named: "image2")!, productCategory: "Sayuran", productStock: 12, productSatuan: "buah", productBuy: 0), Product(productName: "Ikan Salmon", productPrice: 30000, productImage: UIImage(named: "image3")!, productCategory: "Ikan", productStock: 10, productSatuan: "fillet", productBuy: 0), Product(productName: "Pepaya", productPrice: 12000, productImage: UIImage(named: "image4")!, productCategory: "Buah", productStock: 3, productSatuan: "buah", productBuy: 0), Product(productName: "Daun Pepaya", productPrice: 10400, productImage: UIImage(named: "image5")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0), Product(productName: "Bawang Merah", productPrice: 10000, productImage: UIImage(named: "image6")!, productCategory: "Bumbu", productStock: 2000, productSatuan: "gr", productBuy: 0)]
    @IBOutlet weak var namaPedagangLabel: UILabel!
    var namapedagang: String = "Ibu Sumningrah"
    @IBOutlet weak var buttonSymbol: UIImageView!
    @IBOutlet weak var labelTotalBarang: UILabel!
    @IBOutlet weak var labelTotalHargaBarang: UILabel!
    var totalCost: Int = 0
    var totalItem: Int = 0
    var itemordered: [Product] = []
    @IBOutlet weak var toCartBtn: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCell.nib(), forCellWithReuseIdentifier: "ProductCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        namaPedagangLabel.text = "Dagangan\n" + namapedagang
        buttonSymbol.image = UIImage.init(named: "Cart")
        
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
        let fetch = collectionView.indexPathsForVisibleItems
        for index in fetch
        {
            if dummydata[index.row].productBuy >= 1 {
                itemordered.append(dummydata[index.row])
            }
        }
//        performSegue(withIdentifier: "cartVC", sender: itemordered)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cartVC = segue.destination as? CartVC {
            cartVC.itemorderedd = self.itemordered        }
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
            cell.productPrice.text = "Rp. " + String(product.productPrice) + "/" + product.productSatuan
            cell.productStock.text = "Stok: " + String(product.productStock) + " " + product.productSatuan
            cell.productCategory.text = product.productCategory
            
            cell.buyQty.text = String(product.productBuy) +  " " + product.productSatuan
        
        
        cell.btnTapMinusAction.tag = indexPath.row
         cell.btnTapMinusAction.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        cell.btnTapPlusAction.tag = indexPath.row
        cell.btnTapPlusAction.addTarget(self, action: #selector(buttonAction2(_:)), for: .touchUpInside)
            return cell
        }
    
    @objc func buttonAction(_ sender: UIButton){
        let index = sender.tag
        let indexPathArray = IndexPath(item: index, section: 0)
                if dummydata[index].productBuy >= 1{
                        dummydata[index].productBuy = dummydata[index].productBuy - 1
                    totalCost = totalCost - dummydata[index].productPrice
                    totalItem = totalItem - 1
                    labelTotalBarang.text = String(totalItem) + " Barang"
                    labelTotalHargaBarang.text = "Rp. " + String(totalCost)
                    }
        collectionView.reloadItems(at: [indexPathArray])
    }
    
    @objc func buttonAction2(_ sender: UIButton){
        let index = sender.tag
        let indexPathArray = IndexPath(item: index, section: 0)
        if dummydata[index].productBuy < dummydata[index].productStock{
                        dummydata[index].productBuy = dummydata[index].productBuy + 1
            totalCost = totalCost + dummydata[index].productPrice
            totalItem = totalItem + 1
            labelTotalBarang.text = String(totalItem) + " Barang"
            labelTotalHargaBarang.text = "Rp. " + String(totalCost)
                    }
        collectionView.reloadItems(at: [indexPathArray])
    }
}

