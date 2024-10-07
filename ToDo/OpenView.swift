//
//  OpenView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct OpenView: View {
    @Binding var nextView: String
    var body: some View {
        NavigationView {
            List {
                /*ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)*/
            }
            .navigationBarTitle("Files", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        // Handle back action
                        self.nextView = "Home"
                    }
                }
            }
            
        }.navigationViewStyle(.stack)
    }
}

struct OpenView_Previews: PreviewProvider {
    static var previews: some View {
        OpenView(nextView: .constant(""))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
