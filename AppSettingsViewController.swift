//
//  AppSettingsViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 11/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class AppSettingsViewController: UITableViewController {
    
    //Mark: Table cell Details
    
    let sections = ["Manage Exchanges", "General Settings", "Learn More"]
    let manageExchanges = ["BitCoin"]
    let generalSettings = ["Graph Type", "Notification", "Alarm"]
    let learnMore = ["Report Bug or Request Feature", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set table footer to avoid extra rows
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 11/255, green: 50/255, blue: 112/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        let height: CGFloat = 500 //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        self.navigationController?.isNavigationBarHidden  = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor(colorLiteralRed: 0, green: 255, blue: 0, alpha: 0.9)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return manageExchanges.count
        case 1:
            return generalSettings.count
        default:
            return learnMore.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell")
        return cell!

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
