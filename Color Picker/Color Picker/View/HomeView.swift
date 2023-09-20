import SwiftUI

struct HomeView: View {
    var body: some View {
		
		ZStack {
			Rectangle()
				.foregroundColor(Color.primary.opacity(0.07))
				.ignoresSafeArea()
				.padding(.top, UIScreen.main.bounds.width + 30)
			
			VStack {
				Text("Indigo")
					.foregroundColor(.primary)
					.font(.title2)
					.fontWeight(.black)
			
				Text("4B0082")
					.foregroundColor(Color.primary.opacity(0.65))
					.font(.callout)
					.fontWeight(.bold)
			}
			.padding(.trailing)
			.position(x: UIScreen.main.bounds.width - 240,
					  y: UIScreen.main.bounds.height - 365)
			
			Button(action: {}, label: {
				Image(systemName: "square.on.square")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 25)
					.position(x: UIScreen.main.bounds.width - 70,
							  y: UIScreen.main.bounds.height - 365)
			})
			
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(.indigo)
				.frame(width: UIScreen.main.bounds.width / 6.5,
					   height: UIScreen.main.bounds.height / 14)
				.padding(.top, UIScreen.main.bounds.width + 30)
				.position(x: UIScreen.main.bounds.width - 330,
						  y: UIScreen.main.bounds.width - 120)
		}
		
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.preferredColorScheme(.light)
    }
}
