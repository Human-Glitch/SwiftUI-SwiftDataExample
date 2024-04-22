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
