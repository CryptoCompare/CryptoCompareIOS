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
    
    var exchangesArray = [ExchangesSettingTab]()
    var currencies = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.showAlertNoExchangesSelected()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.showAlertNoExchangesSelected()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showAlertNoExchangesSelected() {
        var currencyExchangeMapping = [String:[Int]]()
        
        if UserDefaults.standard.object(forKey: "exchanges") != nil  {
            
            self.exchangesArray = NSKeyedUnarchiver.unarchiveObject(with: (UserDefaults.standard.object(forKey: "exchanges") as! NSData!) as Data!) as! [ExchangesSettingTab]
            self.currencies = UserDefaults.standard.stringArray(forKey: "currencies") ?? [String]()
            
            
            for cur in currencies {
                if (self.exchangesArray.filter{ $0.currency == cur && $0.allowExchange == true}.map{ $0.id}).count > 0 {
                    currencyExchangeMapping[cur] =  self.exchangesArray.filter{ $0.currency == cur && $0.allowExchange == true}.map{ $0.id}
                }
                
            }
                if currencyExchangeMapping.count == 0 {
                    
                    var alertTitle = "Error"
                    var alertMessage = "Please select atleast one exchange in the settings page"
                    var alertActionTitle = "Go to Settings Page"
                    let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: alertActionTitle, style: UIAlertActionStyle.default) { (action) -> Void in
                        self.settingsButton.sendActions(for: .touchUpInside)
                    })
                    self.present(alert, animated: true, completion: nil)
                }
                
            }

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
