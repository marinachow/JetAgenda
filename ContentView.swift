import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var isResultsViewPresented = false
    @State private var departureLocation = ""
    @State private var arrivalLocation = ""
    @State private var departureDate = Date()
    @State private var returnDate = Date()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Jet Agenda! Where would you like to go?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()

                TextField("Departure", text: $departureLocation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Arrival", text: $arrivalLocation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker("Departure Date", selection: $departureDate, displayedComponents: .date)
                DatePicker("Return Date", selection: $returnDate, displayedComponents: .date)
                Button(action: {
                    isResultsViewPresented = true
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .navigationDestination(isPresented: $isResultsViewPresented) {
                    ResultsView(
                        departureLocation: departureLocation,
                        arrivalLocation: arrivalLocation,
                        departureDate: departureDate,
                        returnDate: returnDate
                    )
                }
            }.padding()
            .onChange(of: isResultsViewPresented) {
                if !isResultsViewPresented {
                    departureLocation = ""
                    arrivalLocation = ""
                    departureDate = Date()
                    returnDate = Date()
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
