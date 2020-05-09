//
//  DefaultPage.swift
//  iCare
//
//  Created by Carl He on 4/11/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct DefaultPage: View {

    @ObservedObject var recordListVM = RecordListViewModel()
    @ObservedObject var sharedListViewModel = SharedListViewModel()
    @ObservedObject var profileRepo = ProfileRepository()
    
    var body: some View {
        VStack{
            
            TabView{
                MainView()
                    .tabItem{
                        Image(systemName: "bandage.fill")
                        Text("Main")
                }
                CaseView()
                    .tabItem{
                        Image(systemName: "waveform.path.ecg")
                        Text("Records")
                }
            }
        }
    .environmentObject(recordListVM)
    .environmentObject(sharedListViewModel)
    .environmentObject(profileRepo)
    }
    
}

struct DefaultPage_Previews: PreviewProvider {
    static var previews: some View {
        DefaultPage()
    }
}
