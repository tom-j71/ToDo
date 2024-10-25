//
//  HomeView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct HomeView: View {
    @Binding var nextView: String
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .ignoresSafeArea()
                
            HStack(spacing: 80) {
                VStack(alignment: .center) {
                    LabelView()
                        .padding(.bottom,120)
                    VStack(spacing:70) {
                        AddNewButtonView(viewName: $nextView)
                        OpenButtonView(viewName: $nextView)
                        SettingButtonView(viewName: $nextView)
                                        
                    }.padding(.bottom,60)
                    
                }.padding(.leading,20)
                
                //TODO: The Preview hasn't been added yet
                PreviewView()
                
            }
            
            
        }
    }
}
private struct LabelView: View{
    var body: some View{
        Text("To Do List")
            .font(.system(size:70))
            .fontWeight(.bold)
            .padding(.leading)
            .foregroundColor(.green)
    }
}

private struct AddNewButtonView: View {
    @Binding var viewName : String
    var body: some View {
        Button(action: {
            withAnimation {
                self.viewName = "Add"
            }
            
            
        // Add New action here
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 30))
                Text("Add New")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
            }
        }
    }
}

private struct OpenButtonView: View{
    @Binding var viewName : String
    var body: some View{
        Button(action: {
            withAnimation {
                viewName = "Open"
            }
            
            // Open File action here
        }) {
            HStack {
                Image(systemName: "folder.badge.plus")
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                Text("Open File")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
            }
        }
        
    }
}

private struct SettingButtonView: View{
    @Binding var viewName : String
    var body: some View{
        Button(action: {
            // Settings action here
            withAnimation {
                viewName = "Settings"
            }
            
        }) {
            HStack {
                Image(systemName: "gearshape.2.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
            }
        }
    }
}

private struct PreviewView: View{
    var body: some View{
        
        Color.white
            .frame(width: 450, height: 350)
            .border(.gray
                    .opacity(0.3)
                    ,width: 15)
        
            
            .cornerRadius(8)
            .padding(.trailing)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(nextView: .constant(""))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

