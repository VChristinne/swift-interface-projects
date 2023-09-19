import SwiftUI

struct BerryView: View {
	@EnvironmentObject var vm: BerryViewModel
	let berry: Berry
	let dimensions: Double = 110
	
	var body: some View {
		VStack {
			AsyncImage(url: URL(string: "https://raw.githubusercontent.com/VChristinne/berries/main/\(vm.getBerryIndex(berry: berry)).png")) { image in
				image
					.resizable()
					.scaledToFit()
					.frame(width: dimensions, height: dimensions)
					
			} placeholder: {
				ProgressView()
					.frame(width: dimensions, height: dimensions)
			}
			.background(.thinMaterial)
			.clipShape(Circle())
			
			Text("\(berry.name.capitalized)")
				.font(.system(size: 18, weight: .black, design: .monospaced))
				.padding(.bottom, 20)
		}
	}
}

struct BerryView_Previews: PreviewProvider {
	static var previews: some View {
		BerryView(berry: Berry.sampleBerry)
			.environmentObject(BerryViewModel())
	}
}

