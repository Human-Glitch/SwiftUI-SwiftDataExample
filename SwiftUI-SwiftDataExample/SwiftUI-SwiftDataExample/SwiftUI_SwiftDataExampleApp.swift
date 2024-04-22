//
//  SwiftUI_SwiftDataExampleApp.swift
//  SwiftUI-SwiftDataExample
//
//  Created by Kody Buss on 4/21/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_SwiftDataExampleApp: App {
	let container: ModelContainer = {
		let schema = Schema([Expense.self])
		let container = try! ModelContainer(for: schema, configurations: [])
		return container
	}()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(container)
		//.modelContainer(for: [Expense.self])
    }
	
}
