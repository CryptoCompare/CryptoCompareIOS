//
//  DashboardTableViewTableViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 2/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class DashboardTableViewTableViewController: UITableViewController {

  
    let data = PlacesModel()
    
    @IBOutlet weak var tabelHeader: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
  

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden  = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardTableViewCell

        
        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.shadowLayer.layer.shadowColor = UIColor.black.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.23
        cell.shadowLayer.layer.shadowRadius = 4
        


        
        // Configure the cell...
        
        return cell
    }
    
    
 }
