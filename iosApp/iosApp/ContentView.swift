import SwiftUI
import shared

struct ContentView: View {
    private let contentRepository = ContentRepository()
    @State private var cars: [Car] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 256)
                    VStack(alignment: .leading) {
                        ForEach(cars, id: \.model) { car in
                            HStack {
                                Rectangle()
                                    .frame(width: 72, height: 64)
                                VStack(alignment: .leading) {
                                    Text("\(car.make) \(car.model)")
                                    Text("Price: \(car.customerPrice)")
                                    Text("Rating: \(car.rating)")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.yellow)
                        }
                    }
                    .background(.blue)
                }
            }
            .background(.red)
            .navigationBarTitleDisplayMode(.inline)
            .padding(0)
            .onAppear {
                contentRepository.getCars() { result, error in
                    if let result = result {
                        cars = result
                    } else if let error = error {
                        print("Error: \(error)")
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("GUIDOMIA")
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                    }
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
