//
//  CaseView.swift
//  iCare
//
//  Created by Carl He on 4/30/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI



struct CaseView: View {
    @EnvironmentObject var recordListVM:RecordListViewModel
    @EnvironmentObject var sharedListVM: SharedListViewModel
    
    @State private var sharingOptions = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                GraphView(values: getData(recordListVM: recordListVM))
                List{
                    ForEach(recordListVM.recordCellViewModels){recordCellVM in
                        NavigationLink(destination: Editor_RecordView(recordCellVM: recordCellVM))
                        {
                            RecordCell(recordCellVM: recordCellVM)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("View my record")
            .navigationBarItems(trailing:
                Button(action:{ self.sharingOptions.toggle()
                }) {
                    Image(systemName: "square.and.arrow.up.fill")
                        .imageScale(.medium)
                }
            )
            
        } .alert(isPresented: $sharingOptions, content: {
            Alert(title: Text("Sharing Record"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Sharing")){
                
                self.sharedListVM.addSharedGraph(recordLVM: self.recordListVM)
                }, secondaryButton: .cancel())
        })
    }
}

struct CaseView_Previews: PreviewProvider {
    static var previews: some View {
        CaseView()
    }
}

struct RecordCell: View {
    
    @ObservedObject var recordCellVM:RecordCellViewModel
    
    var onCommit:(Record) -> (Void) = {_ in}
    
    var body: some View {
        HStack{
            if(recordCellVM.caseState == "bell.fill"){
                Image(systemName: recordCellVM.caseState)
                    .foregroundColor(.red)
            }
            Text(String(recordCellVM.record.temp))
            Divider()
            Text(customDateFormatter.string(from: recordCellVM.record.time))
        }
    }
}
