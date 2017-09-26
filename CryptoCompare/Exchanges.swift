//
//  Exchanges.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 27/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import Foundation

class ExchangesSettingTab: NSObject, NSCoding {
    let name: String
    let id: Int
    let allowExchange: Bool
    
    init(name: String, id: Int, allowExchange: Bool) {
        self.name = name
        self.id = id
        self.allowExchange = allowExchange
    }
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.id = decoder.decodeInteger(forKey: "id")
        self.allowExchange = decoder.decodeBool(forKey: "allowExchange")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(id, forKey: "id")
        coder.encode(allowExchange, forKey: "allowExchange")
    }
}
