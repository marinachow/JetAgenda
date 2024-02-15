import SwiftUI

struct FlightDetails: Identifiable {
    let id = UUID()
    var airline: String
    var departureTime: String
    var arrivalTime: String
    var price: String
    var classType: String = "Economy"
    var extraBaggage: Bool = false
    var mealOption: Bool = false
}
