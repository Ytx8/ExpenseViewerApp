//
//  ExpenseViewerData.swift
//  ExpenseViewerApp
//
//  Created by Yogesh Tandulkar on 15/11/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var expensesData: [ExpenseData] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        ExpenseService.fetchExpenses { items, error in
            if let items = items as? [ExpenseItem] {
                DispatchQueue.main.async {
                    self.expensesData = items.map {
                        ExpenseData(
                            id: $0.itemId,
                            title: $0.title,
                            amount: $0.amount,
                            date: $0.date
                        )
                    }
                }
            }
        }
    }
    
}

struct ExpenseData {
    let id: Int
    let title: String
    let amount: Float
    let date: Date
}
