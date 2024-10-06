//
//  SettingView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct SettingView: View {
    @State private var name: String = ""
    
    @Environment(\.viewName) var viewName
    @Binding var nextView: String
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Language")) {
                    TextField("Coming soon", text: $name)
                    
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        // Handle back action
                        self.nextView = "Home"
                    }
                }
                
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(nextView: .constant(""))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
