//
//  ContentView.swift
//  SwiftUI-SwiftDataExample
//
//  Created by Kody Buss on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ExpenseCell: View {
	let expense: Expense
	
	var body: some View {
		HStack {
			Text(expense.date, format: .dateTime.month(.abbreviated).day())
				.frame(width: 70, alignment: .leading)
			Text(expense.name)
			
			Spacer()
			
			Text(expense.value, format: .currency(code: "USD"))
		}
	}
}

struct AddExpenseSheet: View {
	@Environment(\.modelContext) var context
	@Environment(\.dismiss) private var dismiss
	
	@State private var name: String = ""
	@State private var date: Date = .now
	@State private var value: Double = 0
	
	var body: some View {
		NavigationStack {
			Form {
				TextField("Expense Name", text: $name)
				DatePicker("Date", selection: $date, displayedComponents: .date)
				TextField("Value", value: $value, format: .currency(code: "USD"))
					.keyboardType(.decimalPad)
			}
			.navigationTitle("New Expense")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItemGroup(placement: .topBarTrailing) {
					Button("Save") {
						let expense = Expense(name: name, date: date, value: value)
						context.insert(expense) // autosaves
						
						//try! context.save() -- forces save
						dismiss()
					}
				}
				
			}
		}
	}
}

struct UpdateExpenseSheet: View {
	@Environment(\.modelContext) var context
	@Environment(\.dismiss) private var dismiss
	
	@Bindable var expense: Expense
	
	var body: some View {
		NavigationStack {
			Form {
				TextField("Expense Name", text: $expense.name)
				DatePicker("Date", selection: $expense.date, displayedComponents: .date)
				TextField("Value", value: $expense.value, format: .currency(code: "USD"))
					.keyboardType(.decimalPad)
			}
			.navigationTitle("Update Expense")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItemGroup(placement: .topBarTrailing) {
					Button("Done") {
						dismiss()
					}
				}
				
			}
		}
	}
}
