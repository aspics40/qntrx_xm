import SwiftUI
import shared

struct CarListItemView : View {
    let car: Car
    
    var formattedPrice: String {
        car.customerPrice >= 1000
        ? "\(Int(car.customerPrice / 1000))k"
        : "\(Int(car.customerPrice))"
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    imageForCar("\(car.make) \(car.model)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 96, height: 72)
                        .clipped()
                    VStack(alignment: .leading) {
                        Text("\(car.make) \(car.model)")
                            .foregroundColor(.black.opacity(0.45))
                        Text("Price: \(formattedPrice)")
                            .foregroundColor(.black.opacity(0.45))
                        HStack(spacing: 2) {
                            ForEach(0..<min(car.rating, 5), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(hue: 19/360, saturation: 0.91, brightness: 0.99))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Pros:")
                        .font(.subheadline).bold()
                        .foregroundColor(.black.opacity(0.45))
                    ForEach(car.prosList, id: \.self) { pro in
                        HStack(alignment: .top, spacing: 4) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 6, height: 6)
                                .foregroundColor(.orange)
                                .padding(.top, 6)
                            Text(pro)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("Cons:")
                        .font(.subheadline).bold()
                        .foregroundColor(.black.opacity(0.45))
                        .padding(.top, 6)
                    ForEach(car.consList, id: \.self) { con in
                        HStack(alignment: .top, spacing: 4) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 6, height: 6)
                                .foregroundColor(.orange)
                                .padding(.top, 6)
                            Text(con)
                                .foregroundColor(.black)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(hue: 0, saturation: 0, brightness: 0.84))
            
            Rectangle()
                .fill(Color.orange)
                .frame(height: 4)
                .padding(.horizontal)
        }
    }
    
    func imageForCar(_ model: String) -> Image {
        let key = model.replacingOccurrences(of: " ", with: "_")
        return Image(key)
    }
}
