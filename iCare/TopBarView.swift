//
//  TopBarView.swift
//  iCare
//
//  Created by Carl He on 4/14/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        NavigationView{
            Spacer()
                .navigationBarTitle("Home",displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "person.circle")
                    },
                                    trailing:
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "wrench.fill")
                    }
            )
            
        }
        
    }
    
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
