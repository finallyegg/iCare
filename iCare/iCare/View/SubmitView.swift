//
//  ContentView.swift
//  iCare
//
//  Created by Carl He on 4/9/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct SubmitView: View {
    @EnvironmentObject var recordListViewModel:RecordListViewModel
    @State private var record:Record = Record()
    @State private var showing_alert = false
    @State private var nextNotification = 0.1
    var possibleTimeslot = [0.1,5.0,10.0,15.0]
    @Environment(\.presentationMode) var presentationMode
    
    var my_formetter:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                        Toggle(isOn: $record.headache) {
                            
                            Text("Headache ?")
                            
                        }
                        if(record.headache){
                            Text("Pain Level: \(Int(record.pain))")
                                .font(.headline)
                            HStack{
                                Text("Severless: ")
                                
                                Slider(value: $record.pain,in :1.0...10.0,step: 1.0 )
                            }
                        }
                    GeometryReader{ geometry in
                    HStack(){
                        Text("Temp")
                        Spacer()
                        TextField("", value: self.$record.temp, formatter: customNumberFormatter)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        Divider()
                        Picker(selection: self.$record.tempUNIT, label: EmptyView()){
                            ForEach(TempUNIT.allCases,id:\.self){
                                Text($0.rawValue)
                            }
                        }.frame(maxWidth: geometry.size.width / 8)
                        
                    }
                    }
                    
                    DatePicker(selection: $record.time, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                }
                
                Section{
                    Text("Symptom")
                    TextField("Enter your symptoms",text:$record.symptom)
                }
                
                Section{
                    Picker(selection: $nextNotification, label: Text("Reminds in Next")) {
                        ForEach(0..<possibleTimeslot.count){
                            Text(String(self.possibleTimeslot[$0])+" Mins").tag(self.possibleTimeslot[$0])
                        }
                        
                    }
                    
                }
                
                
                Button(action: {
                    self.recordListViewModel.addRecord(record: self.record);
                    self.showing_alert = true
                    ;set_Next_Notification(nextNotificationInterval: Double(self.nextNotification));
                }
                ) {
                    Text("Submit")
                    
                }
                .alert(isPresented: self.$showing_alert, content: {
                    Alert(title: Text("Submission"), message: Text("Submission Success"), dismissButton: .destructive(Text("OK")){
                        self.presentationMode.wrappedValue.dismiss()
                        })
                })
                
            }
            .navigationBarTitle(Text("Enter New Record"),displayMode: .large)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView()
    }
}
