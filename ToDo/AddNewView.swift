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
    @Binding var nextView: String
    
    @Binding var JsonTemp: Schedule
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
                        self.nextView = "Home"
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next") {
                        // Handle next action
                        
                        
                        self.JsonTemp = Schedule(name: name, isImportant: isImportant)
                        self.nextView = "Content"
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
        AddNewView(nextView: .constant(""), JsonTemp: .constant(Schedule(name: "", isImportant: false)))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
