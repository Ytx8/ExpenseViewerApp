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
        VStack {
            HStack {
                Text("Expense Viewer")
                    .font(.system(size: 24, weight: .semibold))
                Spacer()
                Menu(content: {
                    SortMenuItem(title: "Date Ascending", order: .ascending, selectedOrder: $viewModel.sortOrder)
                    SortMenuItem(title: "Date Descending", order: .descending, selectedOrder: $viewModel.sortOrder)
                }, label: {
                    Label("Sort by Date", systemImage: "arrow.up.arrow.down")
                        .foregroundStyle(.black)
                })
            }
            .padding(12)
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.sortedExpenseData, id: \.id) { data in
                        ExpenseRow(item: data)
                            .padding(.horizontal, 10)
                    }
                }
                
            }
        }
        .background(LinearGradient(colors: [.gray, .white], startPoint: .leading, endPoint: .trailing))
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

struct SortMenuItem: View {
    let title: String
    let order: SortOrder
    @Binding var selectedOrder: SortOrder

    var body: some View {
        Button {
            selectedOrder = order
        } label: {
            HStack {
                Text(title)
                Spacer()
                if selectedOrder == order {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}



#Preview {
    ContentView()
}

