//
//  AppSettingsViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 11/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class AppSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
