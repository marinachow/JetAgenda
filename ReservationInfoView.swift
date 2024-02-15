import SwiftUI

struct ReservationInfoView: View {
    var totalPrice: Double
    @Binding var flightDetails: FlightDetails
    
    @State private var passengerInfo: PassengerInfo
    
    init(totalPrice: Double, flight: Binding<FlightDetails>) {
        self.totalPrice = totalPrice
        self._flightDetails = flight
        self._passengerInfo = State(initialValue: PassengerInfo(firstName: "John", lastName: "Doe", phoneNumber: "123-456-7890", email: "john.doe@example.com", nationality: "United States", passportNumber: "123456789", passportExpiryDate: Date()))
    }

    let countries = ["United States", "Canada", "United Kingdom", "France", "Germany", "Italy", "Spain", "Japan", "China", "Australia", "India", "Brazil", "Russia", "Mexico", "South Africa"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Passenger Information")) {
                    TextField("Last Name", text: $passengerInfo.lastName)
                    TextField("First Name", text: $passengerInfo.firstName)
                    TextField("Email", text: $passengerInfo.email)
                        .keyboardType(.emailAddress)
                    TextField("Phone Number", text: $passengerInfo.phoneNumber)
                    TextField("Passport Number", text: $passengerInfo.passportNumber)
                        .keyboardType(.phonePad)
                    Picker("Nationality", selection: $passengerInfo.nationality) {
                        ForEach(countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                    DatePicker("Passport Expiry Date", selection: $passengerInfo.passportExpiryDate, displayedComponents: .date)
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: PaymentView(totalPrice: totalPrice, flightDetails: flightDetails, passengerInfo: passengerInfo)) {
                            Text("Continue to Payment")
                                .padding()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Reservation Info", displayMode: .inline)
        .padding()
    }
}

struct ReservationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationInfoView(totalPrice: 1500.0, flight: .constant(FlightDetails(airline: "Air Canada", departureTime: "08:00 AM", arrivalTime: "11:00 AM", price: "1500€")))
    }
}
