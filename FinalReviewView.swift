import SwiftUI

struct FinalReviewView: View {
    var totalPrice: Double
    var flightDetails: FlightDetails
    var passengerInfo: PassengerInfo
    var paymentInfo: PaymentInfo
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Review Your Booking")
                        .font(.title)
                        .padding(.bottom)
                    
                    Section(header: Text("Flight Details")) {
                        Text("Airline: \(flightDetails.airline)")
                        Text("Departure: \(flightDetails.departureTime) - Arrival: \(flightDetails.arrivalTime)")
                        Text("Class: \(flightDetails.classType)")
                    }
                    
                    Section(header: Text("Passenger Information")) {
                        Text("Name: \(passengerInfo.firstName) \(passengerInfo.lastName)")
                        Text("Email: \(passengerInfo.email)")
                        Text("Passport Number: \(passengerInfo.passportNumber)")
                    }
                    
                    Section(header: Text("Payment Information")) {
                        Text("Card Holder: \(paymentInfo.cardHolderName)")
                        Text("Total Price: \(totalPrice, specifier: "%.2f")€")
                    }
                    
                    NavigationLink(destination: BookingConfirmationView()) {
                        Text("Book Flight")
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Final Review", displayMode: .inline)
    }
}

struct FinalReviewView_Previews: PreviewProvider {
    static var previews: some View {
        FinalReviewView(
            totalPrice: 299.99,
            flightDetails: FlightDetails(
                airline: "Example Airline",
                departureTime: "09:00 AM",
                arrivalTime: "12:00 PM",
                price: "299.99€",
                classType: "Economy",
                extraBaggage: true,
                mealOption: true
            ),
            passengerInfo: PassengerInfo(
                firstName: "John",
                lastName: "Doe",
                phoneNumber: "123-456-7890",
                email: "johndoe@example.com",
                nationality: "USA",
                passportNumber: "A1234567",
                passportExpiryDate: Date()
            ),
            paymentInfo: PaymentInfo(
                cardNumber: "1234 5678 9012 3456",
                expirationDate: "12/23",
                CVV: "123",
                cardHolderName: "John Doe"
            )
        )
    }
}
