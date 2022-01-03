//
//  AddView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import SwiftUI

struct AddView: View {
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack() {
                
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                Button {
                    //
                } label: {
                    Text("save".uppercased())
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .padding(.vertical)
                }

                
            }
            .padding()
                
        }
        .navigationTitle("Add New Item ✒️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
