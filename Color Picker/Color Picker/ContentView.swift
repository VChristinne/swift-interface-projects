import SwiftUI

struct ContentView: View {
    var body: some View {
		
		TabView {
			HomeView()
				.tabItem {
					Image(systemName: "camera")
				}
			
			PaletteView()
				.tabItem {
					Image(systemName: "swatchpalette")
				}
			
			SettingsView()
				.tabItem {
					Image(systemName: "slider.horizontal.3")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
