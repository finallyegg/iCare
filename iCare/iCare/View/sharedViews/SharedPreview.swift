//
//  sharedPreview.swift
//  iCare
//
//  Created by Carl He on 5/7/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI

struct SharedPreview: View {
    var sharedRecords:SharedModel
    var body: some View {
        HStack{
            VStack{
                RHLinePlot(values: getData(sharedData: sharedRecords))
                Text("Case")
                
            }.frame(width:200,height: 200)
                .border(Color.black)
            
            VStack{
            Text("Duration: \(sharedRecords.recordList.count) days")
                Text("High: \(getTemp(sharedData: sharedRecords),specifier: "%.2f")")
            }
        }
    }
}

//struct sharedPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        sharedPreview()
//    }
//}
