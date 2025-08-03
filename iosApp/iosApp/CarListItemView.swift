import SwiftUI
import shared

struct CarListItemView : View {
    let car: Car
    
    var body: some View {
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
