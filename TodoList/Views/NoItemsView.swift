//
//  NoItemsView.swift
//  TodoList
//
//  Created by Kritbovorn Taweeyossak on 6/1/2565 BE.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 24) {
                
                Text("There are no Items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the Add button and add a bunch of items to your to do list!")
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Somethings 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(12)
                }
                .padding(.horizontal, animate ? 20 : 30)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, x: 0, y: animate ? 30 : 20)
                .scaleEffect(animate ? 1.0 : 0.9)
                .offset(y: animate ? -10 : 0)
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        
        
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
                animate.toggle()
            }
        }
    }
    
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            VStack {
                NoItemsView()
            }
            .navigationTitle("Title")
        }
        
    }
}
