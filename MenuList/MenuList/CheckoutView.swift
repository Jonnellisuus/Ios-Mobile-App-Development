//
//  CheckoutView.swift
//  MenuList
//
//  Created by Jonne Kiukas on 4.2.2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Card", "Dining points"]
    static let tipAmounts = [0, 10, 15, 20, 25]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
        var body: some View {
            Form {
                Section {
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(0 ..< Self.paymentTypes.count) {
                            Text(Self.paymentTypes[$0])
                        }
                    }
                    
                    Toggle(isOn: $addLoyaltyDetails.animation()) {
                        Text("Add dining loyalty card")
                    }
                    
                    if addLoyaltyDetails {
                        TextField("Enter you dining ID", text: $loyaltyNumber)
                    }
                }
                
                Section(header: Text("Add a tip")) {
                    Picker("Precentage:", selection: $tipAmount) {
                        ForEach(0 ..< Self.tipAmounts.count) {
                            Text("\(Self.tipAmounts[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                                .font(.largeTitle)
                    ) {
                        Button("Confirm order") {
                            self.showingPaymentAlert.toggle()
                    }
                }
            }
                
            .navigationBarTitle(Text("Payment"), displayMode: .inline)
                .alert(isPresented: $showingPaymentAlert) {
                    Alert(title: Text("Order confimed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - Thank you"), dismissButton: .default(Text("OK")))
            }
        }
    }

    struct CheckoutView_Previews: PreviewProvider {
        static let order = Order()
        
        static var previews: some View {
            CheckoutView().environmentObject(order)
        }
    }
}
