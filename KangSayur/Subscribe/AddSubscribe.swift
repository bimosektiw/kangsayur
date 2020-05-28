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
        
        let searchController = UISearchController(searchResultsController: nil)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Temukan Langganan Tukang Sayur", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}

// going work with table view
extension AddSubscribe: UITableViewDelegate, UITableViewDataSource, AddSubscribeCellDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addSubsTableView.dequeueReusableCell(withIdentifier: idAddSubsCell, for: indexPath) as! AddSubscribeCell
        cell.delegate = self
        cell.subsButtonAction = {
            print("Press subscribe")
        }
        cell.profileImageView.image = #imageLiteral(resourceName: "Aerith-FFVII-Remake-1200x900")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addSubsTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
