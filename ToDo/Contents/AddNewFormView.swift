//
//  AddNewFormView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct AddNewFormView: View {
    @State private var schedule: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var detail: String = ""
    @Binding var isPresented : Bool
    @Binding var sch : Schedule
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Schedule Name")) {
                    TextField("Enter schedule name", text: $schedule)
                }
                
                Section(header: Text("Date Range")) {
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        .onChange(of: startDate) { _ in
                            // Ensure end date is not before start date
                            if endDate < startDate {
                                endDate = startDate
                            }
                        }
                    
                    DatePicker("End Date", selection: $endDate, in: Date()..., displayedComponents: .date)
                        .onChange(of: endDate) { _ in
                            if endDate < startDate {
                                startDate = endDate
                            }
                        }
                }
                
                Section(header: Text("Details")) {
                    TextEditor(text: $detail)
                        .frame(height: 100)
                }
            }
            .navigationBarTitle("Add New Form", displayMode: .inline)
            
            .toolbar {
                ToolbarItem {
                    Button("Done") {
                        // Handle back action
                        
                        let T = Todo(name: self.schedule, startDate: self.startDate, endDate: self.endDate, description: self.detail)
                        
                        sch.todos.append(T)
                        
                        self.isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        // Handle back action
                        self.isPresented = false
                    }
                }
            }
        }.navigationViewStyle(.stack)
    }
}

struct AddNewFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewFormView(isPresented: .constant(true), sch: .constant(Schedule(name: "", isImportant: false)))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

