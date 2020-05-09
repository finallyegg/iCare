//
//  CaseListViewModel.swift
//  iCare
//
//  Created by Carl He on 4/30/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Combine
import Firebase

class RecordListViewModel:ObservableObject{
    @Published var recordRepository = RecordRepository()
    
    @Published var recordCellViewModels = [RecordCellViewModel]()
    

    
    private var cancellables = Set<AnyCancellable>()
    
    init() {

        self.recordRepository.$records
            .map{records in
                records.map{record in
                    RecordCellViewModel(record: record)
                }
        }
        .assign(to: \.recordCellViewModels, on:self)
        .store(in: &cancellables)
    }
    
    func addRecord(record:Record){
        var a = record
        a.userID = Auth.auth().currentUser?.uid
        recordRepository.addRecord(a)
    }
    
    func removeRecord(record:Record){
        recordRepository.removeRecord(record)
    }
}
