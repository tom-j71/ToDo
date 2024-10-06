//
//  StateMachine.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct StateMachine: View {
    
    @State private var viewName: String = "Home"
    var body: some View {
        Group{
            switch viewName{
            case "Home": HomeView(nextView: $viewName)
                    .environment(\.viewName, viewName)
            case "Add": AddNewView()
            case "Open": EmptyView()
            case "Settings": EmptyView()
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