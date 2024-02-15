import SwiftUI

struct PaymentView: View {
    var totalPrice: Double
    var flightDetails: FlightDetails
    var passengerInfo: PassengerInfo
    
    @State private var paymentInfo: PaymentInfo = PaymentInfo()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Payment Details")) {
                    TextField("Card Number", text: $paymentInfo.cardNumber)
                    TextField("Expiration Date (MM/YY)", text: $paymentInfo.expirationDate)
                    TextField("CVV", text: $paymentInfo.CVV)
                    TextField("Card Holder Name", text: $paymentInfo.cardHolderName)
                }
                NavigationLink(destination: FinalReviewView(totalPrice: totalPrice, flightDetails: flightDetails, passengerInfo: passengerInfo, paymentInfo: paymentInfo)) {
                    Text("Proceed to Final Review")
                        .padding()
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .padding()
    }
}


struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(
            totalPrice: 1500.0,
            flightDetails: FlightDetails(
                airline: "Example Airline",
                departureTime: "09:00 AM",
                arrivalTime: "12:00 PM",
                price: "999€",
                classType: "Economy",
                extraBaggage: true,
                mealOption: false
            ),
            passengerInfo: PassengerInfo(
                firstName: "John",
                lastName: "Doe",
                phoneNumber: "1234567890",
                email: "john.doe@example.com",
                nationality: "USA",
                passportNumber: "A1234567",
                passportExpiryDate: Date()
            )
        )
    }
}

