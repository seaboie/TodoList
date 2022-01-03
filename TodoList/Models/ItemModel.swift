//
//  ItemModel.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import Foundation

struct ItemModel: Identifiable {
    
    let id: String = UUID().uuidString
    
    let title: String
    let isCompleted: Bool
    
}
