//
//  Settings.swift
//  iCare
//
//  Created by Carl He on 4/14/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var tempUNit:Bool = false
    
    var body: some View {
        List{
            Toggle(isOn: $tempUNit){
                Text("Click 45 times!")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
