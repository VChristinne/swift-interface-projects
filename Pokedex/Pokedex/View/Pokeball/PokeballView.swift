import SwiftUI

struct PokeballView: View {
	@EnvironmentObject var vm: PokeballViewModel
	let pokeball: Pokeball
	let dimensions: Double = 100
	
	var body: some View {
		VStack {
			AsyncImage(url: URL(string: "https://raw.githubusercontent.com/VChristinne/pokeballs/main/\(vm.getPokeballIndex(pokeball: pokeball)).png")) { image in
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
			
			Text("\(pokeball.name.capitalized)")
				.font(.system(size: 18, weight: .black, design: .monospaced))
				.padding(.bottom, 20)
		}
	}
}

struct PokeballView_Previews: PreviewProvider {
	static var previews: some View {
		PokeballView(pokeball: Pokeball.samplePokeball)
			.environmentObject(PokeballViewModel())
	}
}

