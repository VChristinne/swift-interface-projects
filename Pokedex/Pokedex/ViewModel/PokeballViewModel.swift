import Foundation
import SwiftUI

final class PokeballViewModel: ObservableObject {
	private let pokeballManager = PokeballManager()
	
	@Published var pokeballList = [Pokeball]()
	@Published var pokeballDetails: DetailPokeball?
	@Published var searchText = ""
	
	var filteredPokeball: [Pokeball] {
		return searchText == "" ? pokeballList : pokeballList.filter {
			$0.name.contains(searchText.lowercased())
		}
	}
	
	init() {
		self.pokeballList = pokeballManager.getPokeball()
	}
	
	func getPokeballIndex(pokeball: Pokeball) -> Int {
		if let index = self.pokeballList.firstIndex(of: pokeball) {
			return index + 1
		}
		return 0
	}
	
	func getDetails(pokeball: Pokeball) {
		let id = getPokeballIndex(pokeball: pokeball)
		
		self.pokeballDetails = DetailPokeball(id: 0, cost: 0)
		pokeballManager.getDetailedPokeball(id: id) { data in
			DispatchQueue.main.async {
				self.pokeballDetails = data
			}
		}
	}
}
