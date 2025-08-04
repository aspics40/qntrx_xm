import SwiftUI
import shared

struct ContentView: View {
    private let contentRepository = ContentRepository()
    @State private var cars: [Car] = []
    @State private var expandedCarName: String = ""
    
    @State private var selectedMake: String = ""
    @State private var selectedModel: String = ""
    
    @State var showPickerMake = false
    @State var showPickerModel = false
    
    var filteredCars: [Car] {
        cars.filter { car in
            (selectedMake.isEmpty || car.make == selectedMake) &&
            (selectedModel.isEmpty || car.model == selectedModel)
        }
    }
    
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
                                    .fontWeight(.bold)
                                Text("Get yours now")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading),
                            alignment: .bottom
                        )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Filters")
                            .font(.title3)
                            .foregroundColor(.white)
                        Text(selectedMake.isEmpty ? "Any Make" : selectedMake)
                            .foregroundColor(selectedMake.isEmpty ? .gray : .primary)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onTapGesture { showPickerMake = true }
                            .sheet(isPresented: $showPickerMake) {
                                List {
                                    Button("All") {
                                        selectedMake = ""
                                        showPickerMake = false
                                    }
                                    ForEach(Array(Set(cars.map { $0.make })), id: \.self) { make in
                                        Button(make) {
                                            selectedMake = make
                                            showPickerMake = false
                                        }
                                    }
                                }
                            }
                        
                        Text(selectedModel.isEmpty ? "Any Model" : selectedModel)
                            .foregroundColor(selectedModel.isEmpty ? .gray : .primary)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onTapGesture { showPickerModel = true }
                            .sheet(isPresented: $showPickerModel) {
                                List {
                                    Button("All") {
                                        selectedModel = ""
                                        showPickerModel = false
                                    }
                                    ForEach(Array(Set(cars.map { $0.make })), id: \.self) { make in
                                        Button(make) {
                                            selectedModel = make
                                            showPickerModel = false
                                        }
                                    }
                                }
                            }
                    }
                    .padding()
                    .background(Color(hue: 0, saturation: 0, brightness: 0.52))
                    .cornerRadius(8)
                    .padding()
                    
                    VStack(alignment: .leading) {
                        ForEach(filteredCars, id: \.model) {car in
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
