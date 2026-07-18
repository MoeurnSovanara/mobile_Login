//
//  tabView.swift
//  authentication
//
//  Created by sovanara  on 18/7/26.
//
import SwiftUI

struct tabView : View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("Friends")
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Friends")
                }
            
            Text("Chats")
                .tabItem {
                    Image(systemName: "message")
                    Text("chats")
                }
            
            Text("Setting")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
    }
}

#Preview {
    tabView()
}
