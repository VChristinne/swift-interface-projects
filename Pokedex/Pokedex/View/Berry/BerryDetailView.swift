import SwiftUI

struct BerryDetailView: View {
	@EnvironmentObject var vm: BerryViewModel
	let berry: Berry
	
	var body: some View {
		
		VStack {
			BerryView(berry: berry)
			
			VStack(spacing: 10) {
				Text("**ID**: \(vm.berryDetails?.id ?? 0)")
				Text("**Growth time**: \(vm.berryDetails?.growth_time ?? 0)")
				Text("**Max harvest**: \(vm.berryDetails?.max_harvest ?? 0)")
				Text("**Natural gift power**: \(vm.berryDetails?.natural_gift_power ?? 0)")
				Text("**Smoothness**: \(vm.berryDetails?.smoothness ?? 0)")
				Text("**Soil dryness**: \(vm.berryDetails?.soil_dryness ?? 0)")

			}
		}
		.onAppear {
			vm.getDetails(berry: berry)
		}
	}
}

struct BerryDetailView_Previews: PreviewProvider {
	static var previews: some View {
		BerryDetailView(berry: Berry.sampleBerry)
			.environmentObject(BerryViewModel())
	}
}
