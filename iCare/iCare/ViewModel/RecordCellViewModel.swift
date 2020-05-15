//
//  CaseCellViewModel.swift
//  iCare
//
//  Created by Carl He on 4/30/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import Foundation
import Combine

class RecordCellViewModel: ObservableObject,Identifiable{
    @Published var recordRepository = RecordRepository()
    
    @Published var record:Record
    
    var id:String = ""
    @Published var cancellables = Set<AnyCancellable>()
    @Published var caseState = ""
    
    init(record:Record) {
        self.record = record
        
        $record
            .map{record in
                self.is_fever(temp: record.temp) ? "bell.fill" : ""
        }
        .assign(to: \.caseState, on: self)
        .store(in: &cancellables)
        
        $record
            .compactMap{record in
                record.id
        }
        .assign(to:\.id,on:self)
        .store(in:&cancellables)
        
        $record
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink{ record in
                self.recordRepository.update(record)
                
        }
        .store(in: &cancellables)
    }
    
    
    func is_fever(temp:Double) -> Bool{
        return (temp >= 37.3)
    }
    
}
