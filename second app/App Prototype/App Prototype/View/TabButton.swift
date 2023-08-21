import SwiftUI

struct TabButton: View {
    
	@Binding var selectedTab: String
	var image: String
	var title: String
	var animation: Namespace.ID
	
	var body: some View {
        
		Button(action: {
			withAnimation(.spring()) { selectedTab = title }
			
		}, label: {
			HStack(spacing: 15) {
				Image(systemName: image)
					.font(.title2)
					.frame(width: 30)
				
				Text(title)
					.fontWeight(.semibold)
			}
			.foregroundColor(selectedTab == title ? Color("Color") : .primary)
			.padding(.vertical, 12)
			.padding(.horizontal, 10)
			.frame(maxWidth: getRect().width - 170, alignment: .leading)
			.background(
				ZStack {
					if selectedTab == title {
						Color.orange
							.opacity(selectedTab == title ? 1 : 0)
							.clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 12))
							.matchedGeometryEffect(id: "TAB", in: animation)
					}
				}
			)
		})
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.colorScheme(.dark)
    }
}
