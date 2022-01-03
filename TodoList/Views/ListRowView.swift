//
//  ListRowView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title: "This is the first Item", isCompleted: false))
    }
}
