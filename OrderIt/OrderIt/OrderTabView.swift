//
//  ContentView.swift
//  OrderIt
//
//  Created by Kwasi Nsiah on 6/23/24.
//

import SwiftUI

struct OrderTabView: View {
    var body: some View {
        
        TabView {
            DishView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Acount")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color("mPrimary"))
    }
}

#Preview {
    OrderTabView()
}
