import SwiftUI
import shared

struct ContentView: View {
    private let contentRepository = ContentRepository()
    @State private var cars: [Car] = []

    var body: some View {
        List(cars, id: \.model) { car in
            VStack(alignment: .leading) {
                Text("\(car.make) \(car.model)")
                Text("Racing: \(car.rating)")
                Text("Price: \(car.customerPrice)")
            }
        }
        .onAppear {
            contentRepository.getCars() { result, error in
                if let result = result {
                    cars = result
                } else if let error = error {
                    print("Error: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
