//
//  DishVM.swift
//  OrderIt
//
//  Created by Kwasi Nsiah on 6/23/24.
//

import SwiftUI

final class DishVM: ObservableObject {
    @Published var dishes: [Dish] = []
    
    func getDishes() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let dishes):
                    self.dishes = dishes
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}


