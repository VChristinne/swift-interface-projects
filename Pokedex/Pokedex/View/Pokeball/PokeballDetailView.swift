import SwiftUI

struct PokeballDetailView: View {
	@EnvironmentObject var vm: PokeballViewModel
	let pokeball: Pokeball
	
	var body: some View {
		
		VStack {
			PokeballView(pokeball: pokeball)
			
			VStack(spacing: 10) {
				Text("**ID**: \(vm.pokeballDetails?.id ?? 0)")
				Text("**Cost**: \(vm.pokeballDetails?.cost ?? 0)")
			}
		}
		.onAppear {
			vm.getDetails(pokeball: pokeball)
		}
	}
}

struct PokeballDetailView_Previews: PreviewProvider {
	static var previews: some View {
		PokeballDetailView(pokeball: Pokeball.samplePokeball)
			.environmentObject(PokeballViewModel())
	}
}
