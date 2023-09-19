import SwiftUI

struct HomeView: View {
	
	@State var detail = false
	
	var body: some View {
		VStack {
			
			ScrollView(.vertical, showsIndicators: false) {
				
				HStack(alignment: .top) {
					
					VStack(alignment: .leading, spacing: 15) {
						Text("Air Jordan 1 Retro High OG")
							.font(.title)
							.fontWeight(.heavy)
							.foregroundColor(.black)
						
						Text("Relive the day you joined the team with these sneakers inspired by college jackets.")
							.fontWeight(.heavy)
							.foregroundColor(Color.black.opacity(0.6))
							.frame(width: 180)
						
						Button(action: {
							detail.toggle()
						}) {
							HStack(spacing: 10) {
								Text("Find out")
									.fontWeight(.heavy)
									.foregroundColor(Color.accentColor.opacity(0.8))
								
								Image(systemName: "chevron.right")
									.font(.system(size: 14, weight: .heavy))
							}
							.foregroundColor(.accentColor)
						}
					}
					.overlay(
						Image("Red-White-Two")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(height: 260)
							.offset(x: 65, y: 40)
							.rotationEffect(Angle(degrees: -15.0))
							.shadow(radius: 8)
					)
					.padding()
					.background(
						Color("Mercury")
							.frame(width: 380, height: 255)
							.cornerRadius(20)
							.padding(.top)
						
					)
					.padding(.top, 10)
				}
				
				LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15),
										 count: 2), spacing: 5) {
					ForEach(items) { item in
						ItemView(item: item)
					}
				}
			}
		}
		
		.fullScreenCover(isPresented: $detail) {
			DetailView()
		}
	}
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
			.preferredColorScheme(.dark)
			
    }
}
