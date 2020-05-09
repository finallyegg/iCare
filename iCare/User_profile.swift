//
//  File.swift
//  iCare
//
//  Created by Carl He on 4/29/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

enum Race:String, Codable,CaseIterable,Hashable{
    case Asian
    case African_American
    case White
    case Hispanic
    case Other
    
}



enum Gender:String, Codable, CaseIterable,Hashable{
    case Female
    case Male
}

enum weight_unit:String, Codable, CaseIterable,Hashable{
    case lbs
    case kgs
}

struct User_profile:Codable,Identifiable{
    @DocumentID var id: String? = Auth.auth().currentUser!.uid
    var nickName:String
    var records: [Record]
    var age:Int
    var race:Race
    var gender:Gender
    var email:String
    var weight:Double
    var weight_unit:weight_unit
    
    init() {
        nickName = ""
        records = []
        age = 0
        race = .Asian
        gender = .Male
        email = ""
        weight = 0.0
        weight_unit = .lbs
    }
    
}
