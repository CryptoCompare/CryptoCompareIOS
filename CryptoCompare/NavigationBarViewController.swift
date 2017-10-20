//
//  NavigationBarViewController.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 20/10/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class NavigationBarViewController: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var alertTitle = "Error"
        var alertMessage = "Please select atleast one exchange in the settings page"
        var alertActionTitle = "Go to Settings Page"
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: alertActionTitle, style: UIAlertActionStyle.default) { (action) -> Void in

                self.settingsButton.sendActions(for: .touchUpInside)

            
        })
        self.present(alert, animated: true, completion: nil)

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
