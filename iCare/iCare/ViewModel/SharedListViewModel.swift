//
//  SharedListViewModel.swift
//  iCare
//
//  Created by Carl He on 5/7/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Combine
import Firebase

class SharedListViewModel:ObservableObject{
    @Published var sharedRepository = SharedRepository()
    
    @Published var sharedRecords = [SharedModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.sharedRepository.$sharedRecords
            .map{sharedrecords in
                sharedrecords.map{sharedrecord in
                    SharedModel(sharedModel:sharedrecord)
                }
                
        }
        .assign(to: \.sharedRecords, on: self)
        .store(in: &cancellables)
    }
    
    func addSharedGraph(recordLVM: RecordListViewModel,nickName:String){
        var records = [Record]()
        for recordCellVM in recordLVM.recordCellViewModels{
            records.append(recordCellVM.record)
        }
        sharedRepository.addSharedRecord(records,NickName: nickName)
        
    }
    
    func removeSharedRecord(sharedRecords: SharedModel){
        sharedRepository.removeSharedRecord(sharedRecords)
    }
}
