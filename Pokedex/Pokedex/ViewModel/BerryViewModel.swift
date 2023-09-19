import Foundation
import SwiftUI

final class BerryViewModel: ObservableObject {
	private let berryManager = BerryManager()
	
	@Published var berryList = [Berry]()
	@Published var berryDetails: DetailBerry?
	@Published var searchText = ""
	
	var filteredBerry: [Berry] {
		return searchText == "" ? berryList : berryList.filter {
			$0.name.contains(searchText.lowercased())
		}
	}
	
	init() {
		self.berryList = berryManager.getBerry()
	}
	
	func getBerryIndex(berry: Berry) -> Int {
		if let index = self.berryList.firstIndex(of: berry) {
			return index + 1
		}
		return 0
	}
	
	func getDetails(berry: Berry) {
		let id = getBerryIndex(berry: berry)
		
		self.berryDetails = DetailBerry(id: 0, growth_time: 0, max_harvest: 0, natural_gift_power: 0, smoothness: 0, soil_dryness: 0)
		berryManager.getDetailedBerry(id: id) { data in
			DispatchQueue.main.async {
				self.berryDetails = data
			}
		}
	}
}
