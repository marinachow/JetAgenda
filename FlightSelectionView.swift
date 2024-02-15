import SwiftUI

struct FlightSelectionView: View {
    @Binding var flightDetails: FlightDetails
    
    let additionalServicePrices: [String: Double] = [
        "Extra Baggage": 50.0,
        "In-flight Meal": 30.0
    ]
    
    let classPriceMultiplier: [String: Double] = [
        "Economy": 1.0,
        "Business": 1.5,
        "First Class": 2.0
    ]
    
    var totalPrice: Double {
        let basePrice = Double(flightDetails.price.filter { "0"..."9" ~= $0 }) ?? 0
        let classMultiplier = classPriceMultiplier[flightDetails.classType] ?? 1.0
        var additionalCost = 0.0
        if flightDetails.extraBaggage {
            additionalCost += additionalServicePrices["Extra Baggage"] ?? 0
        }
        if flightDetails.mealOption {
            additionalCost += additionalServicePrices["In-flight Meal"] ?? 0
        }
        return basePrice * classMultiplier + additionalCost
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Flight Details for \(flightDetails.airline)")
                    .font(.headline)
                Text("Departure: \(flightDetails.departureTime) - Arrival: \(flightDetails.arrivalTime)")
                Text("Price: \(totalPrice, specifier: "%.2f€")")
                
                Picker("Select Class", selection: $flightDetails.classType) {
                    Text("Economy").tag("Economy")
                    Text("Business").tag("Business")
                    Text("First Class").tag("First Class")
                }.pickerStyle(SegmentedPickerStyle())
                
                Toggle("Extra Baggage", isOn: $flightDetails.extraBaggage)
                Toggle("In-flight Meal", isOn: $flightDetails.mealOption)
                NavigationLink(destination: ReservationInfoView(totalPrice: totalPrice, flight: $flightDetails)) {
                    Text("Select Flight")
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct FlightSelectionView_Previews: PreviewProvider {
    @State static var flightDetails = FlightDetails(airline: "Air Canada", departureTime: "08:00 AM", arrivalTime: "11:00 AM", price: "1500€")
    
    static var previews: some View {
        FlightSelectionView(flightDetails: $flightDetails)
    }
}
