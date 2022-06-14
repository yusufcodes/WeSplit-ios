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
    let currencySelector: String = Locale.current.currencyCode ?? "GBP"
    
    
    private var totalBill: Double {
        return checkAmount + (checkAmount * (Double(totalTip) / 100) )
    }
    
    // Computed Value
    var totalToPay: Double {
        return totalBill / Double(numPeople + 2)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your check amount", value: $checkAmount, format: .currency(code: currencySelector))
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
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much would you like to tip?")
                }
                
                Section {
                    Text(totalToPay, format: .currency(code: currencySelector))
                } header: {
                    Text("Amount Per Person")
                }
                
                Section {
                    Text(totalBill, format: .currency(code: Locale.current.currencyCode ?? "GBP"))
                } header: {
                    Text("Total Bill")
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
