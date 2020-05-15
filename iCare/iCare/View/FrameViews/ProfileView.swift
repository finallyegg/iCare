//
//  RegisterView.swift
//  iCare
//
//  Created by Carl He on 4/29/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var profileRepo:ProfileRepository
    @State var account : User_profile

    var formatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("User's ID", text: $account.nickName)
                    TextField("Email_Address",text: $account.email).keyboardType(.emailAddress)
                }
                Section{
                    Picker(selection: $account.age, label: Text("Age")) {
                        ForEach(0..<100){
                            Text(String($0)).tag($0)
                        }
                        
                    }
                    Picker(selection: ($account).race, label: Text("Race")){
                        ForEach(Race.allCases,id:\.self){
                            Text($0.rawValue)
                        }
                    }
                    Picker(selection: $account.gender, label: Text("Race")){
                        ForEach(Gender.allCases,id:\.self){
                            Text($0.rawValue)
                        }
                    }
                    GeometryReader{ geometry in
                        HStack(){
                            
                            Text("Weight")
                            //                        Spacer()
                            TextField("Weight", value: self.$account.weight, formatter:self.formatter)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numbersAndPunctuation)
                            Divider()
                            Picker(selection: self.$account.weight_unit,label:EmptyView(), content: {
                                ForEach(weight_unit.allCases,id:\.self){
                                    Text($0.rawValue)
                                }
                            })
                                .frame(maxWidth: geometry.size.width / 7)
                        }
                    }
                    
                    
                    
                }
                Section{
                    Button(action: {self.profileRepo.updateProfile(self.account)
                        self.profileRepo.loadData()
                    }){
                        Text("Update")
                            
                    }
                }
            }.navigationBarTitle("User Profile")
            .navigationBarHidden(false)
//                .frame(width:.infinity)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(account:)
//    }
//}
