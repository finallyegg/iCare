//
//  Util.swift
//  iCare
//
//  Created by Carl He on 4/30/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import SwiftUI

enum TempUNIT: String,CaseIterable,Codable{
    case celsius = "°C"
    case fahrenheit  = "°F"
}

func CtoF(temp_in_C: Double) -> Double {
    return (temp_in_C * 9/5) + 32
}

func FtoC(temp_in_F: Double) -> Double {
    return (temp_in_F - 32) * 5/9
}

var customDateFormatter:DateFormatter{
    let a = DateFormatter()
    a.dateStyle = .short
    a.timeStyle = .short
    return a
}

var customNumberFormatter:NumberFormatter{
    let a = NumberFormatter()
    a.numberStyle = .decimal
    return a
}

func getData(recordListVM:RecordListViewModel) -> [CGFloat]{
    var records = [Double]()
    for recordCellVM in recordListVM.recordCellViewModels{
        records.append(recordCellVM.record.temp)
    }
    return records.map{CGFloat($0)}
}

func getData(sharedData:SharedModel) -> [CGFloat]{
    var records = [Double]()
    for record in sharedData.recordList{
        records.append(record.temp)
    }
    return records.map{CGFloat($0)}
}

func getTemp (sharedData: SharedModel) -> Double{
    var max = 0.0
    for record in sharedData.recordList{
        max = (max < record.temp) ? record.temp : max
    }
    return max
}
//func tempLabel(temp:Double) -> Image{
//    let a = Image(systemName:"tag")
//    if temp >= 36.4 && temp <= 37.5{
//        
//    }else{
//        a.accentColor(.red)
//        return a
//    }
//    return nil
//}
