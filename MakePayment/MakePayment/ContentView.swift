//
//  ContentView.swift
//  MakePayment
//
//  Created by Davin Henrik on 7/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StateTypes(viewModel: StateType())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
