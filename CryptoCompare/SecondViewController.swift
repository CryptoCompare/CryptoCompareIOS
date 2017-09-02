//
//  SecondViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 1/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //Mark: properties
    
    
    @IBOutlet weak var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.backgroundColor = UIColor.init(red: 0, green: 120/255, blue: 1.0, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

