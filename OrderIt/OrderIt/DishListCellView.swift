//
//  DishListCellView.swift
//  OrderIt
//
//  Created by Kwasi Nsiah on 6/23/24.
//

import SwiftUI

struct DishListCellView: View {
    var dish: Dish
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(15)
            
            VStack (alignment: .leading, spacing: 5) {
                Text(dish.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(String(dish.price))
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    DishListCellView(dish: MockData.sampleDish)
}
