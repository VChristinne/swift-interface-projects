import SwiftUI

struct BerriesView: View {
	@StateObject var vm = BerryViewModel()
	
	private let adaptiveColumns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		
		NavigationView {
			ScrollView {
				LazyVGrid(columns: adaptiveColumns, spacing: 10) {
					ForEach(vm.filteredBerry) { berry in
						NavigationLink(destination: BerryDetailView(berry: berry)) {
							BerryView(berry: berry)
						}
					}
				}
				.animation(.easeIn(duration: 0.3), value: vm.filteredBerry.count)
				.navigationTitle("Berries")
				.navigationBarTitleDisplayMode(.automatic)
			}
			.searchable(text: $vm.searchText)
		}
		.environmentObject(vm)
		
	}
}

struct BerriesView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
