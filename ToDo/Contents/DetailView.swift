//
//  DetailView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/7.
//

import SwiftUI

struct DetailView: View {
    @State var schedule: String = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var detail: String = ""
    
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
            
            
        }.navigationViewStyle(.stack)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
