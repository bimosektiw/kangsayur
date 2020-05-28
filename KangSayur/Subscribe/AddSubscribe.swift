//
//  AddSubscribe.swift
//  KangSayur
//
//  Created by Bimo Sekti Wicaksono on 26/05/20.
//  Copyright © 2020 Team 11 MC2. All rights reserved.
//

import UIKit

class AddSubscribe: UIViewController {
    @IBOutlet weak var addSubsTableView: UITableView!
    
    let idAddSubsCell = "addSubsCell" // cell identifier
    let classAddSubsCell = "AddSubscribeCell" // cell name file
    lazy var dummyData = DummyData.init().ListPedagang()
    var throwData: [Pedagang] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()

    }
    
    func setupView() {
        // register AddSubscribeCell to use in tableview
        let nibName = UINib(nibName: classAddSubsCell, bundle: nil)
        addSubsTableView.register(nibName, forCellReuseIdentifier: idAddSubsCell)
    }
    
    func setupNavBar(){
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "Tukang Sayur"
        
        // add search field in navigation bar
        let searchController = UISearchController(searchResultsController: nil)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Temukan Langganan Tukang Sayur", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}

// going work with table view
extension AddSubscribe: UITableViewDelegate, UITableViewDataSource, AddSubscribeCellDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addSubsTableView.dequeueReusableCell(withIdentifier: idAddSubsCell, for: indexPath) as! AddSubscribeCell
        let data = dummyData[indexPath.row]
        cell.delegate = self
        cell.subsButtonAction = {
            if !data.isSubscribe {
                cell.subscribeButton.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.537254902, blue: 0, alpha: 1)
                var subscribeData = self.dummyData[indexPath.row]
                subscribeData.isSubscribe = true
                self.dummyData[indexPath.row].isSubscribe = true
                self.throwData.append(data)
            } else {
                cell.subscribeButton.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.937254902, alpha: 1)
                self.dummyData[indexPath.row].isSubscribe = false
                let newThrowData = self.throwData.filter{$0.name != "\(data.name)"}
                self.throwData = newThrowData
            }
            self.addSubsTableView.reloadData()
        }
        cell.profileImageView.image = UIImage(named: "profile\(indexPath.row+1)")
        cell.nameLabel.text = data.name
        cell.addressLabel.text = data.address
        cell.phoneLabel.text = data.phone
        if data.isSubscribe {
            cell.subscribeButton.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.537254902, blue: 0, alpha: 1)
        } else {
            cell.subscribeButton.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.937254902, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96 //tableviewcell height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addSubsTableView.deselectRow(at: indexPath, animated: true) //dismiss highlight
    }
    
}
