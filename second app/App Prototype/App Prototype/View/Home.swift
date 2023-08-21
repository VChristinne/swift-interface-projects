import SwiftUI

struct Home: View {
	
	@Binding var selectedTab: String
	
	init(selectedTab: Binding<String>) {
		self._selectedTab = selectedTab
		UITabBar.appearance().isHidden = true
	}
	
	var body: some View {
		
		TabView(selection: $selectedTab) {
			HomePage()
				.tag("Home")
			
			History()
				.tag("History")
			
			Notifications()
				.tag("Notifications")
			
			Settings()
				.tag("Settings")
			
			Help()
				.tag("Help")
		}
		
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomePage: View {
	
	var body: some View {
		
		NavigationView {
			
			VStack(alignment: .leading, spacing: 20) {
				Image("Pic")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: getRect().width - 50, height: 300)
					.cornerRadius(20)
				
				VStack(alignment: .leading, spacing: 5, content: {
					Text("Magnus Lightwood-Bane")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(.primary)
					
					Text("High Warlock of Brooklyn")
						.font(.caption)
						.fontWeight(.semibold)
						.foregroundColor(.secondary)
				})
			}
		}
	}
}

struct History: View {
	
	var body: some View {
		
		NavigationView {
			
			Text("History")
				.font(.largeTitle)
				.fontWeight(.heavy)
				.foregroundColor(.primary)
				.navigationTitle("History")
		}
	}
}

struct Notifications: View {
	
	var body: some View {
		
		NavigationView {
			
			Text("Notifications")
				.font(.largeTitle)
				.fontWeight(.heavy)
				.foregroundColor(.primary)
				.navigationTitle("Notifications")
		}
	}
}

struct Settings: View {
	
	var body: some View {
		
		NavigationView {
			
			Text("Settings")
				.font(.largeTitle)
				.fontWeight(.heavy)
				.foregroundColor(.primary)
				.navigationTitle("Settings")
		}
	}
}

struct Help: View {
	
	var body: some View {
		
		NavigationView {
			
			Text("Help")
				.font(.largeTitle)
				.fontWeight(.heavy)
				.foregroundColor(.primary)
				.navigationTitle("Help")
		}
	}
}
