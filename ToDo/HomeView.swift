//
//  HomeView.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/6.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .ignoresSafeArea()
                
                
            HStack(spacing: 100) {
                VStack(alignment: .center) {
                    LabelView()
                        .padding(.bottom,120)
                    VStack(spacing:70) {
                        AddNewButtonView()
                        OpenButtonView()
                        SettingButtonView()
                                        
                    }.padding(.bottom,60)
                    
                }
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

struct AddNewButtonView: View {
    var body: some View {
        Button(action: {
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

struct OpenButtonView: View{
    var body: some View{
        Button(action: {
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

struct SettingButtonView: View{
    var body: some View{
        Button(action: {
            // Settings action here
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

struct PreviewView: View{
    var body: some View{
        
        Color.white
            .frame(width: 450, height: 350)
            .border(.gray
                    .opacity(0.3)
                    ,width: 20)
        
            
            .cornerRadius(8)
            .padding(.trailing)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

