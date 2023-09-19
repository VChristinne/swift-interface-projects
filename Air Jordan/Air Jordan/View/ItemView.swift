import SwiftUI

struct ItemView: View {
	var item: ItemModel
	@State private var selectedImageIndex = 0
	
	var body: some View {
		VStack(spacing: 20) {
			TabView(selection: $selectedImageIndex) {
				ForEach(item.images.indices, id: \.self) { index in
					Image(item.images[index])
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 140, height: 180)
						.clipped()
						.rotationEffect(Angle(degrees: -15.0))
						.shadow(radius: 8)
						.tag(index)
				}
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
			.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
			.frame(width: 150, height: 120)
			
			Text(item.price)
				.font(.footnote)
				.fontWeight(.heavy)
				.foregroundColor(.white)
				.padding(.vertical, 10)
				.padding(.horizontal, 8)
				.background(item.color)
				.cornerRadius(3)
		}
		.padding(.top, 40)
		.padding(.leading, 15)
		.padding([.bottom, .trailing], 8)
		.background(item.color.opacity(0.7))
		.cornerRadius(30)
		.padding(.top, 30)
	}
}

struct ItemView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.preferredColorScheme(.dark)
	}
}
