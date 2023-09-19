import SwiftUI
import FLAnimatedImage

struct PokemonView: View {
	@EnvironmentObject var vm: ViewModel
	let pokemon: Pokemon
	let dimensions: Double = 120
	
	var body: some View {
		VStack {
			if let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/\(vm.getPokemonIndex(pokemon: pokemon)).gif") {
				GeometryReader { geometry in
					GifView(url: url)
						.frame(width: dimensions, height: dimensions)
						.aspectRatio(contentMode: .fit)
				}
				.frame(width: dimensions, height: dimensions)
				.background(.thinMaterial)
				.clipShape(Circle())
				
			} else {
				ProgressView()
					.frame(width: dimensions, height: dimensions)
			}
			
			Text("\(pokemon.name.capitalized)")
				.font(.system(size: 18, weight: .black, design: .monospaced))
				.padding(.bottom, 20)
		}
	}
}

struct PokemonView_Previews: PreviewProvider {
	static var previews: some View {
		PokemonView(pokemon: Pokemon.samplePokemon)
			.environmentObject(ViewModel())
	}
}
