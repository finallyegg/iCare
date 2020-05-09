//
//  SideMenu.swift
//  iCare
//
//  Created by Carl He on 4/29/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct SideMenu: View {
    //
    
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Button(action:{}){
                HStack {
                    
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    //                            .imageScale(.large)
                    Text("Profile")
                        .foregroundColor(.gray)
                    //                            .font(.headline)
                    
                }
            }
            .padding(.top, 30)

            Button(action:{}){
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    //                        .imageScale(.large)
                    Text("Messages")
                        .foregroundColor(.gray)
                    //                        .font(.headline)
                }
            }
            
            Button(action:{}){
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                    //                        .imageScale(.large)
                    Text("Settings")
                        .foregroundColor(.gray)
                    //                        .font(.headline)
                }
            }
            Spacer()
        }
        .padding(.leading)
        .frame(maxWidth: 200, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        
    }
}
struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

