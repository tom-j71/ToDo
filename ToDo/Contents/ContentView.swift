//
//  ContentView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/1.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //Core Data
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    //Switching between different views
    @Binding var nextView: String
    //Modal view
    @State private var isPresentingAddNewForm = false
    //Variables
    @Binding var tempTodo: Todo
    @Binding var jsonTemp: Schedule
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(jsonTemp.todos,id:\.id ) { todo in
                    Button {
                        self.tempTodo = todo
                        self.nextView = "Detail"
                    } label: {
                        HStack{
                            Text(todo.name)
                                .foregroundColor(.black)
                            Text(todo.startDate, formatter: itemFormatter)
                                .foregroundColor(.black)
                            Text(todo.endDate, formatter: itemFormatter)
                                .foregroundColor(.black)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle(jsonTemp.name , displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.tempTodo = Todo(name: "Schedule", startDate: Date(), endDate: Date(), description: "")
                        self.nextView = "Detail"
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        self.nextView = "Open"
                    }
                }
            }
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        }
        .navigationViewStyle(.stack)
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nextView: .constant(""),
                    tempTodo: .constant(Todo(name: "", startDate: Date(), endDate: Date(), description: "")),
                    jsonTemp: .constant(Schedule(name: "", isImportant: false)))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
