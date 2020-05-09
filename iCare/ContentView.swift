//
//  ContentView.swift
//  iCare
//
//  Created by Carl He on 4/9/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct SubmitView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            MapView()
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                Text("Record Page")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                
                Text("record and update your condition HERE")
                    .font(.callout)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Submit")
                        .foregroundColor(.black)
                    
                }
                .padding()
                .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            }
            .padding(.leading)
            
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView()
    }
}
