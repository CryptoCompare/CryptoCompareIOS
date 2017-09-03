//
//  PlacesModel.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 3/9/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import Foundation

class PlacesModel {
    
    class Entry {
        
        let filename: String
        let headingName: String
        
        init(fname: String, heading: String) {
            
            self.filename = fname
            self.headingName = heading
        }
    }
    
    let places = [
        Entry(fname : "bridge.jpeg", heading: "Heading1"),
        Entry(fname : "mountain.jpeg", heading: "Heading2"),
        Entry(fname : "snow.jpeg", heading: "Heading3"),
        Entry(fname : "sunset.jpeg", heading: "Heading4")
     ]
}
