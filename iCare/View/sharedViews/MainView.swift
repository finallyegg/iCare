//
//  MainView.swift
//  iCare
//
//  Created by Carl He on 4/14/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI



struct MainView: View {
    @EnvironmentObject var profileRepo:ProfileRepository
    @State private var is_sideBar_Appear = false
    
    var body: some View {
        ZStack{
            NavigationView{
                ZStack(){
                    BigView()
                        .disabled(is_sideBar_Appear)
                        .blur(radius: is_sideBar_Appear ? 20 : 0)
                    
                    
                    GeometryReader{geometry in
                        HStack{
                            if self.is_sideBar_Appear{
                                SideMenu()
                                    .frame(width:geometry.size.width / 2.5)
                                    .transition(.move(edge: .leading))
                            }
                            Spacer()
                        }
                    }
                }
                .navigationBarTitle("Home",displayMode: .inline)
                .navigationBarItems(leading:
                    NavigationLink(destination: ProfileView(account:self.profileRepo.profile)){
                            Image(systemName: "person.circle")
                                .imageScale(.medium)
                    },
                                    trailing:
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "wrench.fill")
                            .imageScale(.medium)
                    }
                )
            }
            
            
        }
        
    }
}




struct BigView: View {
    @EnvironmentObject var sharedListVM: SharedListViewModel
    
    var body: some View{
        VStack(){
            Text("MAIN PAGE")
            List{
                ForEach(sharedListVM.sharedRecords){ sharedRecord in
                    NavigationLink(destination: SharedDetailView(sharedCase: sharedRecord)){
                        SharedPreview(sharedRecords: sharedRecord)
                            .border(Color.black)
                    }
                    
                    
                }
            }
            Spacer()
            NavigationLink(destination: SubmitView()) {
                HStack(){
                    
                    Image(systemName: "plus")
                    Text("New Record")
                    
                }
                    
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
                
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
