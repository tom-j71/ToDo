//
//  AddNewFormView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct AddNewFormView: View {
    @State var schedule: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var detail: String = ""
    @Binding var isPresented : Bool
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
        AddNewFormView(isPresented: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

