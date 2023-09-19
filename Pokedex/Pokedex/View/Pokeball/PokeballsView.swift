import SwiftUI

struct PokeballsView: View {
	@StateObject var vm = PokeballViewModel()
	
	private let adaptiveColumns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		
		NavigationView {
			ScrollView {
				LazyVGrid(columns: adaptiveColumns, spacing: 10) {
					ForEach(vm.filteredPokeball) { pokeball in
						NavigationLink(destination: PokeballDetailView(pokeball: pokeball)) {
							PokeballView(pokeball: pokeball)
						}
					}
				}
				.animation(.easeIn(duration: 0.3), value: vm.filteredPokeball.count)
				.navigationTitle("Pokeballs")
				.navigationBarTitleDisplayMode(.automatic)
			}
			.searchable(text: $vm.searchText)
		}
		.environmentObject(vm)
		
	}
}

struct PokeballsView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
