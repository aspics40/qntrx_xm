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
                            VStack {
                                HStack {
                                    Rectangle()
                                        .frame(width: 72, height: 64)
                                    VStack(alignment: .leading) {
                                        Text("\(car.make) \(car.model)")
                                            .foregroundColor(.black.opacity(0.45))
                                        Text("Price: \(car.customerPrice)")
                                            .foregroundColor(.black.opacity(0.45))
                                        Text("Rating: \(car.rating)")
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(hue: 0, saturation: 0, brightness: 0.52))
                                
                                Rectangle()
                                    .fill(Color.orange)
                                    .frame(height: 4)
                                    .padding(.horizontal)
                            }
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
