//
//  SignedIn.swift
//  iCare
//
//  Created by Carl He on 5/12/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct SignedIn: View {
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator:Any?
    @State var already_signed_in = false
    
    var body: some View {
        VStack{
        Text("Thanks for using iCare Please signed in")
            signinWIthGoogleButton()
                .frame(width:200,height:45)
            .padding()
                .onTapGesture {
                    self.coordinator = SignInWithGoogleCoordinator()
                    if let coordinator = self.coordinator{
                        (coordinator as! SignInWithGoogleCoordinator).signInflow(){
                            self.already_signed_in.toggle()
                        }
                    }
            }.disabled(already_signed_in)
            
            SignInWithAppleButton()
                .frame(width:200,height:45)
                .onTapGesture {
                    self.coordinator = SignInWithAppleCoordinator()
                    if let coordinator = self.coordinator{
                        (coordinator as! SignInWithAppleCoordinator).startSignInWithAppleFlow {
                            print("Success")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }                    
            }
        }
    }
}

struct SignedIn_Previews: PreviewProvider {
    static var previews: some View {
        SignedIn()
    }
}
