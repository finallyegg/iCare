//
//  SharedModel.swift
//  iCare
//
//  Created by Carl He on 5/7/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SharedModel:Codable,Identifiable {
    @DocumentID var id:String?
    var userID: String
    var userNickName:String
    var recordList: [Record]
    var date = Date()
    
    init() {
        id = ""
        userID = ""
        recordList = []
        userNickName = ""
    }
    init (sharedModel:SharedModel){
        self = sharedModel
    }
}
