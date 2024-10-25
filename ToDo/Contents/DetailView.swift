//
//  DetailView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/7.
//

import SwiftUI

struct DetailView: View {
    @Binding var todo: Todo
    @Binding var nextView: String
    @Binding var jsonTemp: Schedule
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Schedule Name")) {
                    TextField("Enter schedule name", text: $todo.name)
                }

                Section(header: Text("Date Range")) {
                    DatePicker("Start Date", selection: $todo.startDate, displayedComponents: .date)
                        .onChange(of: todo.startDate) { _ in
                            // Ensure end date is not before start date
                            if todo.endDate < todo.startDate {
                                todo.endDate = todo.startDate
                            }
                        }

                    DatePicker("End Date", selection: $todo.endDate, displayedComponents: .date)
                        .onChange(of: todo.endDate) { _ in
                            if todo.endDate < todo.startDate {
                                todo.startDate = todo.endDate
                            }
                        }
                }

                Section(header: Text("Details")) {
                    TextEditor(text: $todo.description)
                        .frame(height: 100)
                }
            }
            .navigationBarTitle("Add New Form", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        // Handle back action
                        let index = jsonTemp.todos.firstIndex { td in
                            td.id == todo.id
                        }
                        if let index = index{
                            jsonTemp.todos[index] = todo
                        }else{
                            jsonTemp.todos.append(todo)
                        }
                        
                        self.nextView = "Content"
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        // Handle back action
                        
                        self.nextView = "Content"
                    }
                }
            }
            
        }.navigationViewStyle(.stack)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(todo: .constant(Todo(name: "", startDate: Date(), endDate: Date(), description: "")),
                   nextView: .constant(""),
                   jsonTemp: .constant(Schedule(name: "", isImportant: false)))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
