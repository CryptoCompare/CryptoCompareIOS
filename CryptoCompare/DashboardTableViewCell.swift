//
//  DashboardTableViewCell.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 3/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    



    @IBOutlet weak var shadowLayer: UIView!
    
    
    //Mark Properties
    
    @IBOutlet weak var currency: UILabel!
    
    @IBOutlet weak var twentyFourHourVolume: UILabel!
    
    @IBOutlet weak var siteName: UILabel!
    
    @IBOutlet weak var currentBuyPrice: UILabel!
    
    @IBOutlet weak var currentSellPrice: UILabel!
    
    @IBOutlet weak var buyLow: UILabel!
    
    @IBOutlet weak var buyHigh: UILabel!
    
    @IBOutlet weak var sellLow: UILabel!
    
    @IBOutlet weak var sellHigh: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
