//
//  SigninWithGoogleButton.swift
//  iCare
//
//  Created by Carl He on 5/13/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI
import Foundation
import Firebase
import GoogleSignIn

struct signinWIthGoogleButton : UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        var button = GIDSignInButton()
        button.colorScheme = .light
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton ,context: Context) {
        
    }
}
