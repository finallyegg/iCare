//
//  editor_RecordView.swift
//  iCare
//
//  Created by Carl He on 5/1/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct Editor_RecordView: View {
    @EnvironmentObject var recordLVM: RecordListViewModel
    @ObservedObject var recordCellVM:RecordCellViewModel
//    @Binding var record:Record = recordCellVM.record
    @State private var edit_mode = false
    @State private var remove_alert = false
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    Toggle(isOn: $edit_mode){
                        Text("Edit")
                    }
                }
                
                Section{
                    
                    VStack{
                        Toggle(isOn: $recordCellVM.record.headache) {
                            
                            Text("Headache ?")
                            
                        }
                        if(recordCellVM.record.headache){
                            Text("Pain Level: \(Int(recordCellVM.record.pain))")
                                .font(.headline)
                            HStack{
                                Text("Severless: ")
                                
                                Slider(value: $recordCellVM.record.pain,in :1.0...10.0,step: 1.0 )
                            }
                        }
                    }
                    
                        GeometryReader{ geometry in
                        HStack(){
                            Text("Temp")
                            Spacer()
                            TextField("", value: self.$recordCellVM.record.temp, formatter: customNumberFormatter)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            Divider()
                            Picker(selection: self.$recordCellVM.record.tempUNIT, label: EmptyView()){
                                ForEach(TempUNIT.allCases,id:\.self){
                                    Text($0.rawValue)
                                }
                            }.frame(maxWidth: geometry.size.width / 8)
                            
                        }
                        }
                        
                    
                    
                    DatePicker(selection: $recordCellVM.record.time, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    
                }.disabled(!edit_mode)
                
                Section{
                    Text("Symptom")
                    TextField("Enter your symptoms",text :$recordCellVM.record.symptom)
                }.disabled(!edit_mode)
                
                
                Button(action: {
                    self.remove_alert.toggle()
                    
                }
                ) {
                    Text("Delete Record").foregroundColor(.red)
                    
                    
                }
                .navigationBarTitle(Text( self.edit_mode ? "Editing" : "Viewing"))
            }
            
                
                
            .alert(isPresented: $remove_alert, content: {
                Alert(title: Text("Remove Record"), message: Text("Are you sure?"), primaryButton: .destructive(Text("DELETE")){
                    
                    self.recordLVM.removeRecord(record: self.recordCellVM.record)
                    self.presentationMode.wrappedValue.dismiss()
                    }, secondaryButton: .cancel())
            })
                
            
        }
        
        
        
    }
}

struct editor_RecordView_Previews: PreviewProvider {
    static var previews: some View {
        Editor_RecordView(recordCellVM: RecordCellViewModel(record: Record()))
    }
}
