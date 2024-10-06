//
//  AddNewView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI


struct AddNewView: View {
    @State private var name: String = ""
    @State private var isImportant: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Name", text: $name)
                    
                    Toggle("Is Important", isOn: $isImportant)
                }
            }
            .navigationBarTitle("Add New", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        // Handle back action
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next") {
                        // Handle next action
                    }
                }
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
            
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
