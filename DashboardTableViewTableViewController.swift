//
//  DashboardTableViewTableViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 2/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class DashboardTableViewTableViewController: UITableViewController {

  

    var curData = [DashboardTableCell]();

    
    override func viewDidLoad() {
        
        self.getCurrentData()
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
        return self.curData.count>0 ? self.curData.count : 0//data.places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardTableViewCell

        
        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.shadowLayer.layer.shadowColor = UIColor.black.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.23
        cell.shadowLayer.layer.shadowRadius = 4
        if self.curData.count>0 {

            cell.currency.text = curData[indexPath.row].currency
            cell.twentyFourHourVolume.text = curData[indexPath.row].twentyFourHourHVolume
            cell.siteName.text = curData[indexPath.row].siteName
            cell.currentBuyPrice.text = curData[indexPath.row].currentBuy
            cell.currentSellPrice.text = curData[indexPath.row].currentSell
            cell.buyLow.text = curData[indexPath.row].buyLow
            cell.buyHigh.text = curData[indexPath.row].buyHigh
            cell.sellLow.text = curData[indexPath.row].sellLow
            cell.sellHigh.text = curData[indexPath.row].sellHigh
//            let a = format(f: "0.2", a: curData[indexPath.row].sellHigh)
//            print(a)
        }
        




        
        // Configure the cell...
        
        return cell
    }
    

    func format(f: String, a: String) -> String {
            return String(format: "%\(f)f", self)
        }
    
    
    func getCurrentData() {
        
        let json: [String: Any] = [
            "Bitcoin":[
                "SGD":[ 1 ,2]
            ]
        ]
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: URL(string: "http://13.59.41.217:8000/api/v1/liveData/")!)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) //as! [String:AnyObject]
            let array1 = responseJSON as? [String:Any]
                for key in (array1?.keys)! {
                    let val = array1?[key] as? [Any]
                    for value  in (val! as? [AnyObject])! {
                        print(value)
                        let buy = value["buy"] as? String
                        let lastDayMaxBuy = value["lastDayMaxBuy"] as? String
                        let lastDayMaxSell = value["lastDayMaxSell"] as? String
                        let lastDayMinBuy = value["lastDayMinBuy"] as? String
                        let lastDayMinSell = value["lastDayMinSell"] as? String
                        let lastHourMaxBuy = value["lastHourMaxBuy"] as? String
                        let lastHourMaxSell = value["lastHourMaxSell"] as? String
                        let lastHourMinBuy = value["lastHourMinBuy"] as? String
                        let lastHourMinSell = value["lastHourMinSell"] as? String
                        let lastMonthMaxBuy = value["lastMonthMaxBuy"] as? String
                        let lastMonthMaxSell = value["lastMonthMaxSell"] as? String
                        let lastMonthMinBuy = value["lastMonthMinBuy"] as? String
                        let lastMonthMinSell = value["lastMonthMinSell"] as? String
                        let lastWeekMaxBuy = value["lastWeekMaxBuy"] as? String
                        let lastWeekMaxSell = value["lastWeekMaxSell"] as? String
                        let lastWeekMinBuy = value["lastWeekMinBuy"] as? String
                        let lastWeekMinSell = value["lastWeekMinSell"] as? String
                        let sell = value["sell"] as? String
                        self.curData.append(DashboardTableCell(currency: "SGD", twentyFourHourHVolume: "0",siteName: key, currentBuy: buy!,currentSell: sell!, buyLow: lastHourMinBuy!, buyHigh: lastHourMaxBuy!, sellLow : lastHourMinSell!, sellHigh: lastHourMaxSell! ))
                        
                    }
                }
            self.tableView.reloadData()
        }
        
        task.resume()
        
        
    }
    
    
 }
