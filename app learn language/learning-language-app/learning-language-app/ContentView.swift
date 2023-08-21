import SwiftUI

struct ContentView: View {
    
	var body: some View {
		
		BarLeftView()
		
    }
}


// MARK: - LEFT BAR
private struct BarLeftView: View {
	
	var body: some View {
		
		VStack {
			Image("app icon rose")
				.resizable()
				.cornerRadius(90)
				.frame(width: 60, height: 60)
				.position(
					x: 60,
					y: 50)
			
			Image(systemName: "barometer")
				.resizable()
				.frame(width: 25, height: 25)
				.position(x: 50, y: -50)
		}
		
	}
	
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.previewInterfaceOrientation(.landscapeRight)
    }
}
