//
//  ListView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first Title!",
        "This is the second Title",
        "This is the third Title"
    ]
    
    @State var checkmarkImage: String = "checkmark.circle"
    
    var body: some View {
        
        List {
            
            ForEach(items, id:\.self) { item in
                ListRowView(title: item, systemImage: checkmarkImage)
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


