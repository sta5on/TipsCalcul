//
//  ContentView.swift
//  TipsCalcul
//
//  Created by Stanislav on 06.07.2025.
//

import SwiftUI



struct ContentView: View {

    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<20) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header:Text("How much tips you want to pay?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages [$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f") is a total amount")
                }
            }
            .navigationBarTitle("Calculator of tips", displayMode: .inline)
        }
    }
}

#Preview {
    ContentView()
}
