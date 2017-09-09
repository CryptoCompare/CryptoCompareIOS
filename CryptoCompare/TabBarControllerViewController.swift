//
//  TabBarControllerViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 5/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class TabBarControllerViewController: UITabBarController {

    
    

    @IBOutlet weak var tabB: UITabBar!
    
    var freshLaunch = true
    override func viewDidLoad() {
        super.viewDidLoad()
//        if freshLaunch == true {
//            freshLaunch = false
//            self.tabB.items =
//           // self.tabB.selectedIndex = 1 // 1st tab
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
