//
//  BitcoinDashboardData.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 18/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import Foundation


class DashboardTableCell {
    
    let currency : String
    let twentyFourHourHVolume : String
    let siteName : String
    let siteId : integer_t = 0
    let currentBuy : String
    let currentSell : String
    let buyLow : String
    let buyHigh : String
    let sellLow : String
    let sellHigh :  String
    
    init(currency : String, twentyFourHourHVolume : String, siteName : String, currentBuy : String, currentSell : String,   buyLow : String, buyHigh : String, sellLow : String, sellHigh :  String) {
        
        self.currency = currency
        self.twentyFourHourHVolume = twentyFourHourHVolume
        self.siteName = siteName
        self.currentBuy = currentBuy
        self.currentSell = currentSell
        self.buyLow = buyLow
        self.buyHigh = buyHigh
        self.sellLow = sellLow
        self.sellHigh = sellHigh
    }
}
