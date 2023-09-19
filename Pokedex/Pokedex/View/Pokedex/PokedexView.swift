import SwiftUI

struct PokedexView: View {
	@StateObject var vm = ViewModel()
	
	private let adaptiveColumns = [
		GridItem(.adaptive(minimum: 180))
	]
	
	var body: some View {
		
		NavigationView {
			ScrollView {
				LazyVGrid(columns: adaptiveColumns, spacing: 12) {
					ForEach(vm.filteredPokemon) { pokemon in
						NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
							PokemonView(pokemon: pokemon)
						}
					}
				}
				.animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
				.navigationTitle("Pokedex")
				.navigationBarTitleDisplayMode(.automatic)
			}
			.searchable(text: $vm.searchText)
		}
		.environmentObject(vm)
		
	}
}

struct PokedexView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
