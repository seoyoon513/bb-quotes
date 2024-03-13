//
//  ContentView.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Break Bad View")
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            
            Text("Bettter Call Saul View")
                .tabItem {
                    Label("Better call Saul", systemImage: "briefcase")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
