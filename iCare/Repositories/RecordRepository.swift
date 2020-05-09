//
//  RecordRepository.swift
//  iCare
//
//  Created by Carl He on 5/2/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecordRepository: ObservableObject{
    let db = Firestore.firestore()
    
    @Published var records = [Record]()
    
    init() {
        loadData()
    }
    func loadData(){
        let userID = Auth.auth().currentUser!.uid
        
        db.collection("users").document(userID)
        .collection("records")
            //sort by time
            .order(by: "time")
            
//            .whereField("userID", isEqualTo: userID)
            .addSnapshotListener{(querySnapshot,error) in
                if let querySnapshot = querySnapshot{
                    self.records =  querySnapshot.documents.compactMap{ document in
                        do{
                            let x = try document.data(as: Record.self )
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
    
    func addRecord(_ record: Record){
        do{
            let userID = Auth.auth().currentUser!.uid
            let _ = try db.collection("users").document(userID)
            .collection("records").addDocument(from: record)
        }
        catch{
            fatalError()
        }
        
    }
    
    func update (_ record:Record){
        let userID = Auth.auth().currentUser!.uid
        if let recordID = record.id{
            do{
                try db.collection("users").document(userID)
                .collection("records").document(recordID)
                    .setData(from: record)
            }
            catch{
                fatalError("Unable to Encode Record: \(error.localizedDescription)")
            }
        }
    }
    
    func removeRecord (_ record: Record){
        let userID = Auth.auth().currentUser!.uid
        if let recordID = record.id{ //if record has ID
            db.collection("users").document(userID)
            .collection("records").document(recordID).delete()
        }
    }
    
    func addProfile(_ profile:User_profile){
        do{
            let userID = Auth.auth().currentUser!.uid
            let _ = try db.collection("users").document(userID)
            .collection("userConfig")
                .addDocument(from: profile)
        }
        catch{
            fatalError()
        }
    }
}
