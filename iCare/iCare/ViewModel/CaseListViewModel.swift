//
//  CaseListViewModel.swift
//  iCare
//
//  Created by Carl He on 4/30/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Combine

class RecordListViewModel:ObservableObject{
    @Published var recordRepository = RecordRepository()
    
    @Published var viewCellViewModels = [recordCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.recordRepository.$records
            .map{records in
                records.map{record in
                    recordCellViewModel(record: record)
                }
        }
        .assign(to: \.viewCellViewModels, on:self)
        .store(in: &cancellables)
    }
    //        self.caseCellViewModels = testRecordData.map{ record in
    //            CaseCellViewModel(record: record)
    //        }
    func addRecord(record:Record){
        let recordVM = recordCellViewModel(record: record)
        self.viewCellViewModels.append(recordVM)
    }
}
