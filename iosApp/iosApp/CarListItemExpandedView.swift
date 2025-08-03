import SwiftUI
import shared

struct CarListItemExpandedView : View {
    let car: Car
    
    var body: some View {
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
                .padding(.leading, 8)
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
                .padding(.leading, 8)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
    }
}
