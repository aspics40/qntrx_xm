import SwiftUI
import shared

struct ContentView: View {
    private let contentRepository = ContentRepository()
    @State private var cars: [Car] = []

    var body: some View {
        List(cars, id: \.model) { car in
            HStack {
                Rectangle()
                    .frame(width: 72, height: 64)
                VStack(alignment: .leading) {
                    Text("\(car.make) \(car.model)")
                    Text("Price: \(car.customerPrice)")
                    Text("Rating: \(car.rating)")
                }
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
