//
//  File.swift
//  iCare
//
//  Created by Carl He on 4/11/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Record:Codable,Identifiable{
    @DocumentID var id:String?
    var pain:Double
    var temp:Double
    var tempUNIT:TempUNIT
    var symptom : String
    var time = Date()
    var headache: Bool
    var userID:String?
    
    init() {
        symptom = ""
        pain = 0
        temp = 0.0
        headache = false
        tempUNIT = .celsius
    }
//    init(ipain:Double,itemp:Double,isympton:[String],iheadache:Bool) {
//        symptom = isympton
//        pain = ipain
//        temp = itemp
//        headache = iheadache
//        tempUNIT = .celsius
//    }
    func submit() -> Bool {
        //Encode
        return true
    }
}

//#if Debug
//let testRecordData = [
//    Record(ipain:9.0,itemp:34.5,isympton:["123"],iheadache:false),
//    Record(ipain:9.0,itemp:37.6,isympton:["456"],iheadache:false),
//    Record(ipain:9.0,itemp:39.7,isympton:["123"],iheadache:false)
//
//]
//#endif
//var Next_Notification_Time:Double = 0.0

