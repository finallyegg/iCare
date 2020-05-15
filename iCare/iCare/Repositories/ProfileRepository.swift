//
//  ProfileRepository.swift
//  iCare
//
//  Created by Carl He on 5/7/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProfileRepository: ObservableObject{
    let db = Firestore.firestore()
    
    @Published var profile = User_profile()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("userProfile").document(userID)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                do{
                    
                     let x = try document.data(as: User_profile.self)
                     self.profile = x!
                }
                catch{
                    print(error)
                }
            } else {
                let a = User_profile()
                self.updateProfile(a)
                self.profile = a
            }
        }
    }
    
    func updateProfile (_ profile:User_profile){
        let userID = Auth.auth().currentUser!.uid
        do{
            try db.collection("userProfile").document(userID)
                .setData(from: profile)
            loadData()
        }
        catch{
            fatalError("Unable to Encode Record: \(error.localizedDescription)")
        }
    }
}
