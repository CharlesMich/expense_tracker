//
//  ContentView.swift
//  IExpense_2
//
//  Created by Charles Michael on 1/28/25.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Expense Tracker")
            .toolbar {
                Button("Add Expense", systemImage: "plus"){
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
        }
    }
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
