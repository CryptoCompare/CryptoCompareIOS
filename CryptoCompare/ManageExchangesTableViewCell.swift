//
//  ManageExchangesTableViewCell.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 12/10/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class ManageExchangesTableViewCell: UITableViewCell {

    
    //MARK: PROPERITES
    @IBOutlet weak var siteName: UILabel!
    
    
    @IBOutlet weak var currency: UILabel!
    
    
    @IBOutlet weak var exchangeAllowedButton: UIButton!
    
    @IBAction func exchangeAllowed(_ sender: Any) {
        
        self.exchangeAllowedButton.isSelected = !self.exchangeAllowedButton.isSelected
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
