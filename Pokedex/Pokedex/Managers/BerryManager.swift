import Foundation

class BerryManager {
	func getBerry() -> [Berry] {
		let data: BerryPage = Bundle.main.decode(file: "berry.json")
		let berry: [Berry] = data.results
		
		return berry
	}
	
	func getDetailedBerry(id: Int, _ completion: @escaping(DetailBerry) -> ()) {
		Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/berry/\(id)/", model: DetailBerry.self) { data in
			completion(data)
		} failure: { error in
			print(error)
		}
	}
}
