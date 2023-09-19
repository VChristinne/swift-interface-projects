import Foundation

class PokeballManager {
	func getPokeball() -> [Pokeball] {
		let data: PokeballPage = Bundle.main.decode(file: "pokeball.json")
		let pokeball: [Pokeball] = data.results
		
		return pokeball
	}
	
	func getDetailedPokeball(id: Int, _ completion: @escaping(DetailPokeball) -> ()) {
		Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/item/\(id)/", model: DetailPokeball.self) { data in
			completion(data)
		} failure: { error in
			print(error)
		}
	}
}
