import SwiftUI

struct DetailView: View {
	
	@Environment(\.presentationMode) var present
	
    var body: some View {
		VStack {
			HStack {
				Button(action: { present.wrappedValue.dismiss() }) {
					Image(systemName: "chevron.left")
						.font(.system(size: 24, weight: .bold))
						.foregroundColor(Color.primary.opacity(0.8))
				}
				
				Spacer(minLength: 0)
			}
			.padding([.horizontal, .top])
			
			VStack(alignment: .leading, spacing: 10) {
				Text("Air Jordan 1")
					.font(.system(size: 45, weight: .heavy))
					.foregroundColor(Color("Salmon"))
				
				Text("€169.99")
					.font(.system(size: 30, weight: .heavy))
					.foregroundColor(Color.primary.opacity(0.6))
			}
			.padding(.top)
			
			VStack {
				HStack(alignment: .top, spacing: 20) {
					VStack(alignment: .leading, spacing: 20) {
						Image("Red-White-Two")
							.resizable()
							.aspectRatio(contentMode: .fit)
					}
				}
			}
			
			Spacer()
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
			.preferredColorScheme(.dark)
    }
}
