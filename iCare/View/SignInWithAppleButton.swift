//
//  SignInWithAppleButton.swift
//  iCare
//
//  Created by Carl He on 5/6/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton:UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
