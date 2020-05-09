//
//  SharedRepository.swift
//  iCare
//
//  Created by Carl He on 5/7/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class SharedRepository: ObservableObject{
    let db = Firestore.firestore()
    
    @Published var sharedRecords = [SharedModel]()
    init() {
        loadData()
    }
    
    func loadData() {
        
        db.collection("sharedRecords")
        .addSnapshotListener{(querySnapshot,error) in
                if let querySnapshot = querySnapshot{
                    self.sharedRecords =  querySnapshot.documents.compactMap{ document in
                        do{
                            let x = try document.data(as: SharedModel.self )
                            return x
                        }
                        catch{
                            print(error)
                        }
                        return nil
                    }
                }
        }
    }
    
    func addSharedRecord(_ records: [Record]){
        var shared = SharedModel()
        shared.recordList = records
        shared.userID = Auth.auth().currentUser!.uid
        
        do{
            let _ = try db.collection("sharedRecords")
                .addDocument(from: shared)
        }
        catch{
            fatalError()
        }
    }
    
    func removeSharedRecord(_ sharedModel: SharedModel){
        if let recordID = sharedModel.id{
            db.collection("sharedRecords")
                .document(recordID).delete()
        }
    }
}
