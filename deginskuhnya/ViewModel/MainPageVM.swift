//
//  MainPageVM.swift
//  deginskuhnya
//
//  Created by Vladislav Condratiev on 21.08.2021.
//

import Foundation


class MainPageVM: ObservableObject {
    @Published var cuisine: [Сuisine] = [
        Сuisine(id: 1, name: "ASIAN"),
        Сuisine(id: 2, name: "RUSSIAN"),
        Сuisine(id: 3, name: "AZERBAJAIN"),
        Сuisine(id: 4, name: "UKRAINIAN")
    ]
    
    @Published var currentDishes: [Dishes] = []
    
    func getRandomDishesByCategory(cat: Int){
        Network.shared.apollo.fetch(query: GetAllDishesQuery()){ result in
            switch result{
            case let .success(graphQlResult):
                if let dishes = graphQlResult.data?.dishes{
                   _ = dishes.map({ dish in
                        self.currentDishes.append(Dishes(dishes: dish))
                    })
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func addNewDish(dish: Dishes){
        Network.shared.apollo.perform(mutation: CreateDishMutation(category: dish.category, description: dish.description, imageURL: dish.imageURL, name: dish.name)){ result in
            switch result{
            case .success(_):
                print("Add new dish")
            case let .failure(error):
                print(error)
            }
            
        }
    }
}
//Network.shared.apollo.fetch(query: GetParkingPlaceBookingsQuery(dateRange: datesRange,
//                                                                parkingPlace: ParkingPlaceIdInput(parkingPlaceId: id))) { [weak self] result in
//    guard let strongSelf = self else { return }
//
//    switch result {
//    case let .success(graphQLResult):
//        if let bookings = graphQLResult.data?.getParkingPlaceBookings {
//            let bookingModels = bookings.map { BookingModel(booking: $0) }
//            strongSelf.bookingModels.accept(bookingModels)
//        }
//
//        if let error = graphQLResult.errors?.first {
//            let ext = error.extensions?["exception"] as? [String: Any]
//            let response = ext?["response"] as? [String: Any]
//            let message = response?["message"] as? [String]
//            Utils.standartAlertMessage(message: (message?.first ?? ext?["message"] as? String) ?? "", title: "Error")
//        }
//    case let .failure(error):
//        Utils.standartAlertMessage(message: error.localizedDescription, title: "Error")
//    }
//}
