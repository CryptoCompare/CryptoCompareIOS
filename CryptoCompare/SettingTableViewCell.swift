//
//  SettingTableViewCell.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 27/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    
    //Mark: Properties
    
    @IBOutlet weak var exchangeName: UILabel!
    
    
    @IBAction func exchangeDisplayVal(_ sender: Any) {
        
        
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
