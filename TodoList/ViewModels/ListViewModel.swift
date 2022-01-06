//
//  ListViewModel.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 4/1/2565 BE.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    let itemsKey: String = "items_list"
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    @Published var showAlert: Bool = false
  
    
    init () {
        getItems()
    }
    
    func getItems() {
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        
        guard let decodeItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        items = decodeItems
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
    
    
    func updateItem(currentItem: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == currentItem.id}) {
            items[index] = currentItem.updateCompletion()
        }
    }
    
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
