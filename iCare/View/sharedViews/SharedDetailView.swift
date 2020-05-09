//
//  SharedView.swift
//  iCare
//
//  Created by Carl He on 5/7/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SharedDetailView: View {
    @State var sharedCase: SharedModel
    @EnvironmentObject var sharedListViewModel:SharedListViewModel
    @State private var removeOption = false
    @Environment(\.presentationMode) var presentationMode
    
    func valueStickLabel(value: CGFloat) -> some View {
        Text("\(String(format: "%.1f", value))")
    }
    var body: some View {
        ScrollView{
            VStack(spacing:3){
                RHInteractiveLinePlot(
                    values: getData(sharedData: sharedCase),
                    occupyingRelativeWidth: 0.9,
                    showGlowingIndicator: false, valueStickLabel: { value in
                        self.valueStickLabel(value: value)
                })
                    .border(Color.blue)
                    .frame(maxWidth: .infinity, minHeight: 100,maxHeight: 300)
                
                List{
                    ForEach(sharedCase.recordList.indices){idx in
//                        print(record)
                        SharedCaseCellView(record: self.sharedCase.recordList[idx]).frame(minHeight:60)
                    }
                }.frame(maxHeight:450)
                
            }.frame(minHeight: 650)
                if (sharedCase.userID == Auth.auth().currentUser!.uid){
                    Button(action:{ self.removeOption.toggle()
                    }) {
                        Text("Delete ").foregroundColor(Color.white)
                        .padding()
                            .background(Color.red)
                            .cornerRadius(40)
                    }
                    .frame(minHeight:20)
                }
                Text("Comment")
        }
        .alert(isPresented: self.$removeOption, content: {
            Alert(title: Text("Remove Record"), message: Text("Are you sure?"), primaryButton: .destructive(Text("DELETE")){
                
                self.sharedListViewModel.removeSharedRecord(sharedRecords:self.sharedCase)
                self.presentationMode.wrappedValue.dismiss()
                }, secondaryButton: .cancel())
        })
        
        
        
    }
}




struct SharedCaseCellView: View {
    var record:Record
    var body:some View{
        GeometryReader{geometry in
            VStack{
                HStack{
                    Text("Temp \(self.record.temp,specifier: "%.1f")")
                    Spacer()
                    Text("Headache: \(String(self.record.headache))")
                }
                HStack{
                    Text("Symptom:  \(self.record.symptom)")

                }
                Text("Date: \(customDateFormatter.string(from: self.record.time))")
            }
        }
    }
}


//struct SharedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SharedView()
//    }
//}
