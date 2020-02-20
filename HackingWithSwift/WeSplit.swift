//
//  ContentView.swift
//  HackingWithSwift
//
//  Created by Robert Lorentz on 2020-02-11.
//  Copyright © 2020 Robert Lorentz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2

    var tipPercentages = [0, 5, 10, 15 ]

    var totalPerPerson: Double {
        let numberOfPeopleDouble = Double(numberOfPeople) ?? 2
        let peopleCount = Double(numberOfPeopleDouble + 2)
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
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("How much tip do you want to leave?")) {

                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                TextField("Number of people", text: $numberOfPeople).keyboardType(.decimalPad)

                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
