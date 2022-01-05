//
//  ListViewModel.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 4/1/2565 BE.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    @Published var showAlert: Bool = false
    
//    @Environment(.\presentationMode) var presentationMode
    
    init () {
        getItems()
    }
    
    func getItems() {
        
        let newItems = [
            ItemModel(title: "This is the first Title!", isCompleted: false),
            ItemModel(title: "This is the second Title", isCompleted: true),
            ItemModel(title: "This is the third Title", isCompleted: false)
            
        ]
        
        items.append(contentsOf: newItems)
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet: IndexSet, int: Int) {
        
        items.move(fromOffsets: indexSet, toOffset: int)
    }
    
    func addItem(title: String) {
        
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func hasLessThanThreeCharacters(textFieldText: String) -> Bool {
        
        if textFieldText.count < 3 {
            
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    
    
}
