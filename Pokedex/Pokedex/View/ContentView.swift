import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			PokedexView()
				.tabItem {
					Image(systemName: "lanyardcard")
					Text("Pokedex")
				}
			
			BerriesView()
				.tabItem {
					Image(systemName: "tree")
					Text("Berries")
				}
			
			PokeballsView()
				.tabItem {
					Image(systemName: "cricket.ball.fill")
					Text("Pokeballs")
				}
		}
		.accentColor(.red)

	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
			.colorScheme(.light)
    }
}
