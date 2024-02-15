import SwiftUI

struct BookingConfirmationView: View {
    var body: some View {
        VStack {
            Text("Booking Confirmed!")
                .font(.largeTitle)
            Text("You will receive an email with your booking details.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .padding()
        .navigationBarTitle("Confirmation", displayMode: .inline)
    }
}

struct BookingConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        BookingConfirmationView()
    }
}
