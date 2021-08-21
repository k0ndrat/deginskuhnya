//
//  Plate.swift
//  deginskuhnya
//
//  Created by Vladislav Condratiev on 21.08.2021.
//

import Foundation


class Dishes {
    var id : Int
    var category : Int
    var name : String?
    var description : String?
    var imageURL : String?
    
    init(dishes: GetAllDishesQuery.Data.Dish) {
        id = dishes.id
        category = dishes.category
        name = dishes.name
        description = dishes.description
        imageURL = dishes.description
    }
}

