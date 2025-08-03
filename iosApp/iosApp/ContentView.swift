import SwiftUI
import shared

struct ContentView: View {
    private let contentRepository = ContentRepository()
    @State private var cars: [Car] = []
    @State private var expandedCarName: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    Image("Tacoma")
                        .resizable()
                        .frame(height: 256)
                        .clipped()
                        .overlay(
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Tacoma 2021")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Get yours now")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading),
                            alignment: .bottom
                        )
                    VStack(alignment: .leading) {
                        ForEach(cars, id: \.model) {car in
                            CarListItemView(car: car, expandedCarName: $expandedCarName)
                        }
                    }
                }
            }
            .background(.white)
            .navigationBarTitleDisplayMode(.inline)
            .padding(0)
            .onAppear {
                contentRepository.getCars() { result, error in
                    if let result = result {
                        cars = result
                        expandedCarName = "\(cars.first?.make ?? "") \(cars.first?.model ?? "")"
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
            .toolbarBackground(Color(hue: 19/360, saturation: 0.91, brightness: 0.99), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
