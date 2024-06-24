//
//  Dish.swift
//  OrderIt
//
//  Created by Kwasi Nsiah on 6/23/24.
//

import Foundation

struct Dish: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct DishResponse: Decodable {
    let request: [Dish]
}


struct MockData {
    static let sampleDish = Dish(id: 0001,
                                 name: "Test",
                                 description: "Sample Description blah blah blah", price: 9.99, imageURL: "", calories: 99,
                                 protein: 99,
                                 carbs: 99)
    static let dishes = [sampleDish, sampleDish, sampleDish, sampleDish, sampleDish]
}
