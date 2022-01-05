//
//  AddView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 3/1/2565 BE.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var textFieldText: String = ""
   
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                
                Button {

                    if listViewModel.hasLessThanThreeCharacters(textFieldText: textFieldText) {
                        listViewModel.addItem(title: textFieldText)
                        presentationMode.wrappedValue.dismiss()
                    
                    }
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
        .alert("You should have at least 3 characters 😀 🥺 😱", isPresented: $listViewModel.showAlert) {
            Button(role: .cancel) {
                //
            } label: {
                Text("ตกลง")
            }

        }


    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
