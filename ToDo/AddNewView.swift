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
    @Environment(\.viewName) var viewName
    @Binding var nextView: String
    @Environment(\.tempJson) var tempJson
    @Binding var JsonTemp: String
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
                        let newSchedule = Schedule(name: name, isImportant: isImportant)
                        let newScheduleString = newSchedule.toJson()
                        
                        self.JsonTemp = newScheduleString!
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
        AddNewView(nextView: .constant(""), JsonTemp: .constant(""))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
