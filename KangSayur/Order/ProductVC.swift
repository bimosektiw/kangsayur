//
//  ProductVC.swift
//  KangSayur
//
//  Created by Hubert Daryanto on 14/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

private let reuseIdentifier = "productCell"

struct Product{
    var productName: String
    var productPrice: Int
    var productImage: UIImage
    var productCategory: String
    var productStock: Int
    var productSatuan: String
    var productBuy: Int
}

class ProductVC: UICollectionViewController {
    var btnTapMinusAction : ((ProductVC?)-> Void)? = nil
    var dummydata = [Product(productName: "Terong", productPrice: 10000, productImage: UIImage(named: "image1")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0), Product(productName: "Timun", productPrice: 10400, productImage: UIImage(named: "image2")!, productCategory: "Sayuran", productStock: 12, productSatuan: "buah", productBuy: 0), Product(productName: "Ikan Salmon", productPrice: 30000, productImage: UIImage(named: "image3")!, productCategory: "Ikan", productStock: 10, productSatuan: "fillet", productBuy: 0), Product(productName: "Pepaya", productPrice: 12000, productImage: UIImage(named: "image4")!, productCategory: "Buah", productStock: 3, productSatuan: "buah", productBuy: 0), Product(productName: "Daun Pepaya", productPrice: 10400, productImage: UIImage(named: "image5")!, productCategory: "Sayuran", productStock: 3, productSatuan: "kg", productBuy: 0), Product(productName: "Bawang Merah", productPrice: 10000, productImage: UIImage(named: "image6")!, productCategory: "Bumbu", productStock: 2000, productSatuan: "gr", productBuy: 0)]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dummydata.count
        }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let product = dummydata[indexPath.row]
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCell)
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
                if dummydata[index].productBuy >= 1{
                        dummydata[index].productBuy = dummydata[index].productBuy - 1
                    }
        collectionView.reloadData()
    }
    
    @objc func buttonAction2(_ sender: UIButton){
        let index = sender.tag
                if dummydata[index].productBuy >= 0{
                        dummydata[index].productBuy = dummydata[index].productBuy + 1
                    }
        collectionView.reloadData()
    }
    
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
