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
    let generalSettings = ["Notification", "Alarm"]
    let learnMore = ["Report Bug or Request Feature", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 11/255, green: 50/255, blue: 112/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        let height: CGFloat = 20 //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        self.navigationController?.isNavigationBarHidden  = false
        //Set table footer to avoid extra rows
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

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
    func buttonAction(sender: UIButton!) {
        var btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            print("nigga")
            self.performSegue(withIdentifier: "BitcoinExchanges", sender: self)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "BitcoinExchanges" {
////            if let destination = segue.destination as? ManageExchangesTableViewController
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell")
        if indexPath.section == 0 {
    
            let button : UIButton = UIButton(type:UIButtonType.custom) as UIButton
            
            button.frame = CGRect(origin: CGPoint(x: 40,y :60), size: CGSize(width: 100, height: 24))
            let cellHeight: CGFloat = 44.0
            button.center = CGPoint(x: 50, y: cellHeight / 2.0)
          //  button.backgroundColor = UIColor.red
            
            button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            button.setTitle(manageExchanges[indexPath.row], for: UIControlState.normal)
            button.setTitleColor(UIColor.black, for: UIControlState.normal)
            button.tag = 1
            cell?.addSubview(button)
            //self.view.addSubview(btn)
        } else if indexPath.section == 1 {
            
        }
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
