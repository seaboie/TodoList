//
//  ListView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        
        ZStack {
            
            if listViewModel.items.isEmpty {
                
                NoItemsView()
                    .transition(.scale.animation(.easeInOut))
                
            } else {
                
                List {
                    
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    listViewModel.updateItem(currentItem: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                }
                .listStyle(PlainListStyle())
                
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button {
                    //
                } label: {
                    EditButton()
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
        .environmentObject(ListViewModel())
        
    }
}


