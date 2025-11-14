//
//  ContentView.swift
//  ExpenseViewerApp
//
//  Created by Yogesh Tandulkar on 15/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        let sortedByDateExpenses = viewModel.expensesData.sorted(by: { $0.date > $1.date })
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(sortedByDateExpenses, id: \.id) { data in
                        ExpenseRow(item: data)
                    }
                }
                
            }
        }
        .padding()
    }
}

struct ExpenseRow: View {
    let item: ExpenseData

    var body: some View {
        HStack {
            Text(item.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.primary)

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(item.amount, format: .number.precision(.fractionLength(2)))
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.gray)

                Text(item.date.formatted(date: .numeric, time: .omitted))
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
    }
}


#Preview {
    ContentView()
}

