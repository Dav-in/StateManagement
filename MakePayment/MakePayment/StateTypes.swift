//
//  StateTypes.swift
//  MakePayment
//
//  Created by Davin Henrik on 7/6/22.
//

import SwiftUI

class StateType: ObservableObject {
    @Published var tcInfoBox: Bool = false
    @Published var tcFooterMessage: Bool = false
    @Published var reviewPayBtn: Bool = true
    @Published var acctName: String = "Start Position"
    @Published var acctPerson: String = "Start Position"
    @Published var acctAge: String = "Start Position"
    @Published var acceptStatus: Bool = false
    @Published var modelData = [StateData]()
    @Published var newModelData = StateData()
}

struct StateTypes: View {
    @ObservedObject var viewModel: StateType
    var body: some View {
        VStack {
            Text("\(viewModel.acctName)")
                .padding()
            Text("\(viewModel.acctPerson)")
            Text("\(viewModel.acctAge)")
            Text(viewModel.acceptStatus ? "True" : "False")
            
        HStack {
            Button("tc", action: { getAcctType(acctType: .tc) })
            Button("neutral", action: { getAcctType(acctType: .neutral) })
            Button("reset", action: { getAcctType(acctType: .reset) })
        }
        .padding(.bottom)
            
        VStack {
            Button("Accepted", action: {
                viewModel.acceptStatus.toggle()
            })
            }
        }
    }
    enum AcctType {
        case tc
        case neutral
        case reset
    }

    func getAcctType(acctType: AcctType) {
        switch acctType {
        case .tc:
            viewModel.tcInfoBox = true
            viewModel.tcFooterMessage = true
            viewModel.reviewPayBtn = false
            viewModel.acctName = "Terms & Conditions"
            viewModel.acctAge = viewModel.newModelData.age[0]
            viewModel.acctPerson = viewModel.newModelData.names[0]
            viewModel.acceptStatus = false
            
        case .neutral:
            viewModel.tcInfoBox = false
            viewModel.tcFooterMessage = false
            viewModel.acctName = "Standard"
            viewModel.acctAge = viewModel.newModelData.age[1]
            viewModel.acctPerson = viewModel.newModelData.names[1]
            viewModel.acceptStatus = false
            
        case .reset:
            viewModel.tcInfoBox = false
            viewModel.tcFooterMessage = false
            viewModel.acctName = "Checking"
            viewModel.acctAge = viewModel.newModelData.age[2]
            viewModel.acctPerson = viewModel.newModelData.names[2]
            viewModel.acceptStatus = false
        }
    }

}

struct StateData {
    let names = ["Mark", "Sue", "Tim"]
    let age = ["32", "47", "68"]
}
