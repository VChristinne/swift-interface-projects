import Foundation

struct PokeballPage: Codable {
	let count: UInt
	let next: String
	let results: [Pokeball]
}

struct Pokeball: Codable, Identifiable, Equatable {
	let id = UUID()
	let name: String
	let url: String
	
	static var samplePokeball = Pokeball(name: "master-ball",
										 url: "https://pokeapi.co/api/v2/item/1/")
}

struct DetailPokeball: Codable {
	let id: UInt
	let cost: UInt
}
