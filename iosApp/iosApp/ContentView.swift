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
                            CarListItemView(car: car)
                        }
                    }
                    .background(.blue)
                }
            }
            .background(.purple)
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
