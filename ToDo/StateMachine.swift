//
//  StateMachine.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct StateMachine: View {
    @State private var viewName: String = "Home"
    @State private var tempJson: Schedule = Schedule(name: "", isImportant: false)
    @State private var tempTodo: Todo = Todo(name: "", startDate: Date(), endDate: Date(), description: "")
    var body: some View {
        Group{
            switch viewName{
                
            case "Home": HomeView(nextView: $viewName)
                    
            case "Add": AddNewView(nextView: $viewName
                                  ,JsonTemp: $tempJson)
                    
            case "Open": OpenView(nextView: $viewName)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    
            case "Settings": SettingView(nextView: $viewName)
                    
            case "Content": ContentView(nextView: $viewName, tempTodo: $tempTodo,
                                        jsonTemp: $tempJson)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            case "Detail": DetailView(todo: $tempTodo, nextView: $viewName, jsonTemp: $tempJson)
                    
                    
            default:
                EmptyView()
            }
            
            
        }.transition(.slide)
    }
}

struct StateMachine_Previews: PreviewProvider {
    static var previews: some View {
        StateMachine()
            .previewInterfaceOrientation(.landscapeLeft)
            
    }
}
