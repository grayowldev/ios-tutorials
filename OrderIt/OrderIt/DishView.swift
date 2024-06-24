//
//  DishView.swift
//  OrderIt
//
//  Created by Kwasi Nsiah on 6/23/24.
//

import SwiftUI

struct DishView: View {
    @StateObject var viewModel = DishVM()
    
    
    var body: some View {
        NavigationView {
            List(viewModel.dishes) { dish in
               DishListCellView(dish: dish)
            }
            .navigationTitle("Dish List")
        }
        .onAppear {
            viewModel.getDishes()
        }
    }
}

#Preview {
    DishView()
}
