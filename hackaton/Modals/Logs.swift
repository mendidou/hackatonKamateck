//
//  Logs.swift
//  hackaton
//
//  Created by mendy aouizerat  on 03/12/2020.
//

import Foundation

class Logs: Codable {
    var id : String?
    
    init(id: String) {
        self.id = id
    }
}

class ScannerLogs: Codable {
    var userId: String?
    var locationId: String?
    var date: Date?
    
    init(userId: String , locationId:String?, date:Date) {
        self.userId = userId
        self.locationId = locationId
        self.date = date
    }
    
}
