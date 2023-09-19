import Foundation

struct BerryPage: Codable {
	let count: UInt
	let next: String
	let results: [Berry]
}

struct Berry: Codable, Identifiable, Equatable {
	let id = UUID()
	let name: String
	let url: String
	
	static var sampleBerry = Berry(name: "cheri",
									   url: "https://pokeapi.co/api/v2/berry/1/")
	
}

struct DetailBerry: Codable {
	let id: UInt
	let growth_time: UInt
	let max_harvest: UInt
	let natural_gift_power: UInt
	let smoothness: UInt
	let soil_dryness: UInt
}
