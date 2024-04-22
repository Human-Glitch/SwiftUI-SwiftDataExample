//
//  Expense.swift
//  SwiftUI-SwiftDataExample
//
//  Created by Kody Buss on 4/21/24.
//

import Foundation
import SwiftData

@Model
class Expense {
	var name: String
	var date: Date
	var value: Double
	
	init(name: String, date: Date, value: Double) {
		self.name = name
		self.date = date
		self.value = value
	}
}
