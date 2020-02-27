//
//  Student.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation

class Student {
    
    // Atributos
    let name: String
    let accountNumber: String
    let description: String
    let imageUrl: String
    
    init(name: String, accountNumber: String, imageUrl: String, description: String) {
        self.name = name
        self.accountNumber = accountNumber
        self.imageUrl = imageUrl
        self.description = description
    }
    
    convenience init?(studentData: [String: Any]) {
        guard
            let name = studentData["name"] as? String,
            let accountNumber = studentData["account_number"] as? String,
            let imageUrl = studentData["image_url"] as? String,
            let description = studentData["description"] as? String
        else { return nil }
        
        self.init(name: name, accountNumber: accountNumber, imageUrl: imageUrl, description: description)
    }
    
}
