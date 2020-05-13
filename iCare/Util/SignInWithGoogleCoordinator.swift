//
//  SignInWithGoogleCoordinator.swift
//  iCare
//
//  Created by Carl He on 5/13/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

class SignInWithGoogleCoordinator:NSObject,GIDSignInDelegate{
    func signInflow(){
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance().signIn()
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // ...
        if let error = error {
          print(error.localizedDescription)
          return
        }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        // ...
        Auth.auth().currentUser?.link(with: credential, completion: {(authResult,error) in
            print(authResult)
        })
          // User is signed in
          // ...
        
    }
    
    
    
}
