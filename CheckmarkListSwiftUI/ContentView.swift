//
//  ContentView.swift
//  CheckmarkListSwiftUI
//
//  Created by naresh kukkala on 03/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedFruits: [String] = [String]()
    let fruits = ["Apple", "Orange", "Banana", "Cherry", "Coconut", "Kiwi"]
    
    var body: some View {
        VStack {
            List(fruits, id: \.self) { fruit in
                HStack {
                    Text(fruit)
                    Spacer()
                    ZStack {
                        
                        if selectedFruits.contains(fruit) {
                            Image(systemName: "checkmark.square.fill")
                                .font(.largeTitle)
                        } else {
                            Image(systemName: "square")
                                .font(.largeTitle)
                        }
                        
                        
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            if selectedFruits.contains(fruit) {
                                selectedFruits = selectedFruits.filter { $0 != fruit }
                            } else {
                                selectedFruits.append(fruit)
                            }
                        }
                }
            }
            
            Text("Selected Fruits")
                .font(.title)
            
            List(selectedFruits, id: \.self) { fruit in
                Text(fruit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

