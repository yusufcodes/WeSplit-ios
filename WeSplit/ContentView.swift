//
//  ContentView.swift
//  WeSplit
//
//  Created by Yusuf Chowdhury on 14/06/2022.
//

import SwiftUI

struct ContentView: View {
    // Specify state values using @State
    @State private var checkAmount = 0.0
    @State private var numPeople = 0
    @State private var totalTip = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 20]
    
    // Computed Value
    var totalToPay: Double {
        let totalToPay = checkAmount + (checkAmount * (Double(totalTip) / 100) )
        let totalPerPerson = totalToPay / Double(numPeople + 2)
        return totalPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your check amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                        .keyboardType(UIKeyboardType.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $totalTip) {
                        // Iterate over tipPercentages and each number in the array is the unique identifier
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much would you like to tip?")
                }
                
                Section {
                    Text(totalToPay, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
