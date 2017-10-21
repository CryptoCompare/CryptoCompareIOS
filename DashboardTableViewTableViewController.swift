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
    var exchangesArray = [ExchangesSettingTab]()
    var currencies = [String]()

    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        
       // self.getCurrentData()
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
         self.getCurrentData()
        self.navigationController?.isNavigationBarHidden  = true

    }

    override func viewWillDisappear(_ animated: Bool) {

        curData.removeAll()
        self.tableView.reloadData()
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
        return cell
    }
    
    
    
    
    func getCurrentData() {
        
        if UserDefaults.standard.object(forKey: "exchanges") != nil  {
            
            self.exchangesArray = NSKeyedUnarchiver.unarchiveObject(with: (UserDefaults.standard.object(forKey: "exchanges") as! NSData!) as Data!) as! [ExchangesSettingTab]
            self.currencies = UserDefaults.standard.stringArray(forKey: "currencies") ?? [String]()
            var currencyExchangeMapping = [String:[Int]]()
            
            for cur in currencies {
                if (self.exchangesArray.filter{ $0.currency == cur && $0.allowExchange == true}.map{ $0.id}).count > 0 {
                    currencyExchangeMapping[cur] =  self.exchangesArray.filter{ $0.currency == cur && $0.allowExchange == true}.map{ $0.id}
                }
                
            }
            
            if currencyExchangeMapping.count > 0 {

                let jsonData: [String: Any] = [
                    "Bitcoin" : currencyExchangeMapping]
                let exchanges = try? JSONSerialization.data(withJSONObject: jsonData)
                var request = URLRequest(url: URL(string: "http://13.59.41.217:8000/api/v1/liveData/")!)
                request.httpMethod = "POST"
                request.httpBody = exchanges
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        print(error?.localizedDescription ?? "No data")
                        return
                    }
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) //as! [String:AnyObject]
                    let array1 = responseJSON as? [String:Any]
                    for key in (array1?.keys)! {
                        let val = array1?[key] as? [Any]
                        for v  in (val! as? [AnyObject])! {
                            //   print(v)
                            var value = v[0] as? [String:String]
                            let buy = self.reduceDecimal(value : (value!["buy"] as! String))
                            // print(buy)
                            let lastDayMaxBuy = self.reduceDecimal(value : (value!["lastDayMaxBuy"] as! String))
                            let lastDayMaxSell = self.reduceDecimal(value : (value!["lastDayMaxSell"] as! String))
                            let lastDayMinBuy = self.reduceDecimal(value : (value!["lastDayMinBuy"] as! String))
                            let lastDayMinSell = self.reduceDecimal(value : (value!["lastDayMinSell"] as! String))
                            let lastHourMaxBuy = self.reduceDecimal(value : (value!["lastHourMaxBuy"] as! String))
                            let lastHourMaxSell = self.reduceDecimal(value : (value!["lastHourMaxSell"] as! String))
                            let lastHourMinBuy = self.reduceDecimal(value : (value!["lastHourMinBuy"] as! String))
                            let lastHourMinSell = self.reduceDecimal(value : (value!["lastHourMinSell"] as! String))
                            let lastMonthMaxBuy = self.reduceDecimal(value : (value!["lastMonthMaxBuy"] as! String))
                            let lastMonthMaxSell = self.reduceDecimal(value : (value!["lastMonthMaxSell"] as! String))
                            let lastMonthMinBuy = self.reduceDecimal(value : (value!["lastMonthMinBuy"] as! String))
                            let lastMonthMinSell = self.reduceDecimal(value : (value!["lastMonthMinSell"] as! String))
                            let lastWeekMaxBuy = self.reduceDecimal(value : (value!["lastWeekMaxBuy"] as! String))
                            let lastWeekMaxSell = self.reduceDecimal(value : (value!["lastWeekMinBuy"] as! String))
                            let lastWeekMinBuy = self.reduceDecimal(value : (value!["lastWeekMinBuy"] as! String))
                            let lastWeekMinSell = self.reduceDecimal(value : (value!["lastWeekMinSell"] as! String))
                            let cur = value!["currency"] as! String
                            let sell = self.reduceDecimal(value : (value!["sell"] as! String))
                            self.curData.append(DashboardTableCell(currency: cur, twentyFourHourHVolume: "0",siteName: key, currentBuy: buy,currentSell: sell, buyLow: lastHourMinBuy, buyHigh: lastHourMaxBuy, sellLow : lastHourMinSell, sellHigh: lastHourMaxSell ))
                            
                        }
                    }
                    self.tableView.reloadData()
                }
                task.resume()
            } else {

            }
            
           
        } else {

        }

    }
    
    func reduceDecimal(value : String) -> String {
        
        return String(Float32(value)!);
    }
    
    
 }
