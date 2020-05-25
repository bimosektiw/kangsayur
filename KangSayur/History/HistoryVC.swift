//
//  HistoryVC.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 12/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    struct History {
        var name: String
        var date: String
        var order: String
        var total: String
    }
    
    var historyArray = [History(name: "John", date: "16/01/2020", order: "500gr tempe, 500gr bawang putih, 12pcs telur, 1pcs kol, 100gr cabe rawit", total: "Rp. 80.000"), History(name: "Mary", date: "24/05/2020", order: "500gr tempe, 500gr bawang putih", total: "Rp. 20.000")]
    
    @IBOutlet weak var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTable.reloadData()
        
        historyTable.dataSource = self
        historyTable.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! historyTableViewCell
        
        cell.historyNameLb?.text = historyArray[indexPath.row].name
        cell.historyDateLb?.text = historyArray[indexPath.row].date
        cell.historyOrderLb?.text = historyArray[indexPath.row].order
        cell.historyTotalLb?.text = historyArray[indexPath.row].total
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            historyArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Unsubsribe"
    }

        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class historyTableViewCell: UITableViewCell {
    @IBOutlet weak var historyNameLb: UILabel!
    @IBOutlet weak var historyDateLb: UILabel!
    @IBOutlet weak var historyOrderLb: UILabel!
    @IBOutlet weak var historyTotalLb: UILabel!
    
}
