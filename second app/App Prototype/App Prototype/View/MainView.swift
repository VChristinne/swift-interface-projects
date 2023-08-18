import SwiftUI

struct MainView: View {
	
	@State var selectedTab = "History"
	@State var showMenu = false
	
	var body: some View {
		
		ZStack {
			Color("Color")
				.ignoresSafeArea()
			
			SideMenu(selectedTab: $selectedTab)
			
			ZStack {
				Color.orange
					.opacity(0.4)
					.cornerRadius(showMenu ? 15 : 0)
					.offset(x: showMenu ? -25 : 0)
					.shadow(color: Color.orange.opacity(0.5),
							radius: 5,
							x: -5,
							y: 0)
					.padding(.vertical, 30)

				Home(selectedTab: $selectedTab)
					.cornerRadius(showMenu ? 15 : 0)
				
				Color.orange
					.opacity(0.25)
					.cornerRadius(showMenu ? 15 : 0)
					.offset(x: showMenu ? -50 : 0)
					.shadow(color: Color.orange.opacity(0.5),
							radius: 5,
							x: -5,
							y: 0)
					.padding(.vertical, 60)
				
				Home(selectedTab: $selectedTab)
					.cornerRadius(showMenu ? 15 : 0)
					
			}
			.scaleEffect(showMenu ? 0.85 : 1)
			.offset(x: showMenu ? getRect().width - 120 : 0)
			.ignoresSafeArea()
			.overlay(
				Button(action: {
					withAnimation(.spring()) {
						showMenu.toggle()
					}
					
				}, label: {
					Image(systemName: showMenu ? "chevron.right.2" : "chevron.right")
						.foregroundColor(showMenu ? .white : .primary)
						.font(.system(size: 20, weight: .regular))
						.rotationEffect(.degrees(showMenu ? 0 : 180))
				})
				.padding()
				,alignment: .topLeading
			)
		}
	}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
	func getRect() -> CGRect {
		return UIScreen.main.bounds
	}
}
