//
//  DetailedView.swift
//  iCare
//
//  Created by Carl He on 4/17/20.
//  Copyright © 2020 Carl He. All rights reserved.
//

import SwiftUI
//import (./)

struct GraphView: View {
    @EnvironmentObject var recordListVM:RecordListViewModel
    
    let values:[CGFloat]
//    let values: [CGFloat] = (0...12).map { _ in CGFloat.random(in: (36...40)) }
    func valueStickLabel(value: CGFloat) -> some View {
        Text("\(String(format: "%.2f", value))")
    }
    var body: some View {
            RHInteractiveLinePlot(
                values: values,
                occupyingRelativeWidth: 0.9,
                showGlowingIndicator: false, valueStickLabel: { value in
                    self.valueStickLabel(value: value)
            })
                .border(Color.blue)
                .frame(maxWidth: .infinity, minHeight: 100,maxHeight: 300)

    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView( values: [])
    }
}
