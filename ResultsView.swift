import SwiftUI
import RealityKit
import RealityKitContent

struct ResultsView: View {
    var departureLocation: String
    var arrivalLocation: String
    var departureDate: Date
    var returnDate: Date
    
    @State private var flightData: [FlightDetails] = [
        FlightDetails(airline: "Air Canada", departureTime: "08:00 AM", arrivalTime: "11:00 AM", price: "1500€", classType: "Economy", extraBaggage: false, mealOption: false),
        FlightDetails(airline: "Air France", departureTime: "01:00 PM", arrivalTime: "04:00 PM", price: "1800€", classType: "Economy", extraBaggage: false, mealOption: false),
        FlightDetails(airline: "Aeroméxico", departureTime: "06:00 PM", arrivalTime: "09:00 PM", price: "2000€", classType: "Economy", extraBaggage: false, mealOption: false)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Flights from \(departureLocation) to \(arrivalLocation)")
                        .font(.headline)
                    Text("Departure Date: \(departureDate.formatted(date: .long, time: .omitted))")
                    Text("Return Date: \(returnDate.formatted(date: .long, time: .omitted))")
                        .padding(.bottom)
                    
                    ForEach($flightData, id: \.airline) { $flightDetails in
                        NavigationLink(destination: FlightSelectionView(flightDetails: $flightDetails)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(flightDetails.airline)
                                        .font(.title2)
                                    Text("Depart: \(flightDetails.departureTime) - Arrive: \(flightDetails.arrivalTime)")
                                }
                                Spacer()
                                Text(flightDetails.price)
                                    .font(.title3)
                            }
                        }
                        .padding()
                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("Search Results")
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(
            departureLocation: "Paris",
            arrivalLocation: "New York",
            departureDate: Date(),
            returnDate: Date().addingTimeInterval(86400 * 7)
        )
    }
}
