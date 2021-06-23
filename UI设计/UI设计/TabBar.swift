//
//  TabBar.swift
//  UI设计
//
//  Created by 之后. on 2021/6/5.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home()
                .tabItem  {(VStack {
                    Image("IconHome")
                    Text("Home")
                       
                }) }
                .tag(1)
            ContentView()
                .tabItem  {(VStack {
                    Image("IconCards")
                    Text("Certifiactes")
                       
                }) }
                .tag(2)
            UpdateList()
                .tabItem  {(VStack {
                    Image("IconSettings")
                    Text("Updates")
                       
                }) }
                .tag(3)
        }
        .padding(.bottom, -34.0)
        
        
        
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environment(\.colorScheme, .dark)
    }
}
