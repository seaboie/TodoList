//
//  ListView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first Title!", isCompleted: false),
        ItemModel(title: "This is the second Title", isCompleted: true),
        ItemModel(title: "This is the third Title", isCompleted: false)
        
    ]
    
    var body: some View {
        
        List {
            
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button {
                    //
                } label: {
                    Text("Edit")
                }

            }
            ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button {
                    //
                } label: {
                    NavigationLink("Add") {
                        AddView()
                    }
                }

            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
        
    }
}


