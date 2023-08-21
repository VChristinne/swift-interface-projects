import SwiftUI

struct SideMenu: View {
	
	@Binding var selectedTab: String
	@Namespace var animation
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 15, content: {
			Image("Profile")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 70, height: 70)
				.cornerRadius(10)
				.padding(.top, 50)
			
			VStack(alignment: .leading, spacing: 6, content: {
				Text("Magnus Bane")
					.font(.title)
					.fontWeight(.heavy)
					.foregroundColor(.primary)
				
				Button(action: {}, label: {
					Text("View Profile")
						.fontWeight(.semibold)
						.foregroundColor(.primary)
						.opacity(0.7)
				})
			})
			
			VStack(alignment: .leading, spacing: 10) {
				TabButton(selectedTab: $selectedTab,
						  image: "house",
						  title: "Biographical",
						  animation: animation)
				
				TabButton(selectedTab: $selectedTab,
						  image: "clock.arrow.circlepath",
						  title: "History",
						  animation: animation)
				
				TabButton(selectedTab: $selectedTab,
						  image: "bell.badge",
						  title: "Notifications",
						  animation: animation)
				
				TabButton(selectedTab: $selectedTab,
						  image: "gearshape",
						  title: "Settings",
						  animation: animation)
				
				TabButton(selectedTab: $selectedTab,
						  image: "questionmark.circle",
						  title: "Help",
						  animation: animation)
			}
			.padding(.leading, -16)
			.padding(.top, 50)
			
			Spacer()
			
			TabButton(selectedTab: .constant(""),
					  image: "rectangle.portrait.and.arrow.right",
					  title: "Log Out",
					  animation: animation)
			.padding(.leading, -16)
			
		})
		.padding()
		.frame(maxWidth: .infinity,
			   maxHeight: .infinity,
			   alignment: .topLeading)
	}
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
