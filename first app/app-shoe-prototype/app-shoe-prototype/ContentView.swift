import SwiftUI

struct ContentView: View {

	var body: some View {
		
		BodyView {
			
			TopShelf()
			DescriptionView()
			CheckoutView()
		}
		
	}
}


// MARK: - HEADER
private struct TopShelf: View {
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 0) {
			Text("Christian")
				.font(.custom("Savoye LET", size: 120))
				.foregroundColor(.black)
				.bold()
				.padding(.top, 30)
			Text("Louboutin")
				.font(.custom("Savoye LET", size: 120))
				.foregroundColor(.white)
				.padding(.top, -45)
		}
		
		.frame(
			maxWidth: .infinity,
			alignment: .leading)
		.padding(.top, 20)
		.padding(.leading, 20)
	}
}


// MARK: - ITEM
private struct SelectedHeels: View {
	
	var body: some View {
		
		Image("shoes")
			.resizable()
			.scaledToFit()
			.frame(
				width: UIScreen.main.bounds.width * 0.90,
				height: UIScreen.main.bounds.height * 0.5)
			.rotationEffect(.degrees(0))
			.shadow(radius: 100)
			.position(
				x: UIScreen.main.bounds.width / 2,
				y: 300)
	}
	
}


// MARK: - DESCRIPTION
private struct DescriptionView: View {
	
	@State private var isLiked = false
	
	var body: some View {
					
		VStack(alignment: .leading) {
			Text("New Very Privé")
				.font(.custom("Savoye LET", size: 35))
				.foregroundColor(.red)
				.tracking(1.2)
				.position(x: 105, y: 80)
			
			Text("120 mm Open toe pumps - Patent calf")
				.font(.custom("Savoye LET", size: 25))
				.foregroundColor(.secondary)
				.tracking(1.2)
				.position(x: 165, y: 25)
			
			Text("A Louboutin icon, the New Very Privé pump embodies the glamour of 1950s pin-ups and the daring of burlesque.")
				.font(.custom("Academy Engraved LET", size: 16))
				.frame(width: 350)
				.foregroundColor(.primary)
				.tracking(1)
				.position(x: 195, y: 3)
			
			HStack(alignment: .top) {
				Text("€795.00")
					.font(.custom("Academy Engraved LET", size: 20))
					.foregroundColor(.red)
					.tracking(1.5)
					.position(x: 335, y: -170)
				
				HeartIconView(isLiked: $isLiked)
				
			}
			
			SizeView()
			
		}
		
	}
}


// MARK: - SIZE VIEW
private struct SizeView: View {
	
	var body: some View {
		
		VStack(spacing: 0) {
			Text("Sizes")
				.font(.custom("Academy Engraved LET", size: 24))
				.tracking(1.2)
				.foregroundColor(.red)
				.position(x: 45, y: -90)
			
			SizePicker()
				.position(x: 195, y: -55)
		}
	}
}


// MARK: - SIZE PICKER
private struct SizePicker: View {
	@State var selectedSize = 0
	var options = Array(34...43)
	var layout = GridItem(.adaptive(minimum: 60))
	
	var body: some View {
		LazyVGrid(columns: [layout], spacing: 12) {
			ForEach(options, id: \.self) { item in
				SizePickerOption(option: item, selected: $selectedSize)
			}
		}
	}
}


private struct SizePickerOption: View {
	
	var option: Int
	@Binding var selected: Int
	
	var body: some View {
		
		Text("\(option)")
			.font(.custom("Academy Engraved LET", size: 16))
			.padding(10)
			.foregroundColor(option == selected ? Color.red : .primary)
			.frame(width: 40, height: 40)
			.background(SizePickerOptionBG(option: option, selected: selected))
			.onTapGesture {self.selected = option}
			.animation(.easeInOut, value: self.selected)
	}
}


private struct SizePickerOptionBG: View {
	
	var option: Int
	var selected: Int
	
	var body: some View {
			
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.stroke(.primary, lineWidth: 1)
			RoundedRectangle(cornerRadius: 20)
				.fill(Color.red)
				.scaleEffect(0.95)
				.opacity(option == selected ? 1 : 0)
		}
	}
}


// MARK: - CHECKOUT
private struct CheckoutView: View {
	
	var body: some View {
		
		HStack(spacing: 5) {
			Button("Checkout") {}
				.font(.custom("Academy Engraved LET", size: 23))
				.foregroundColor(.primary)
				.frame(
					maxWidth: .infinity,
					minHeight: 60,
					alignment: .center)
				.background(
					ZStack(alignment: .trailing) {
						Rectangle()
							.fill(.red)
							.padding(.leading, 0)
						RoundedRectangle(cornerRadius: 10)
							.fill(.red)
					}
				)
		}
	}
}


// MARK: - HEART ICON
private struct HeartIconView: View {
	
	@Binding var isLiked: Bool
	
	var body: some View {
		Image(systemName: isLiked ? "heart.fill" : "heart")
			.position(x: 150, y: -560)
			.foregroundColor(isLiked ? .black : .primary)
			.onTapGesture {
				self.isLiked.toggle()
			}
	}
}


private struct BodyView<T: View>: View {
	
	var content: T
	
	init(@ViewBuilder block: () -> T) {
		self.content = block()
	}
	
	var body: some View {

		ZStack(alignment: .top) {
			VStack {
				self.content
			}
			.background(CircleBackgroundEffect())
			SelectedHeels()
		}
		.ignoresSafeArea()
	}
}

// MARK: - CIRCLE
struct CircleBackgroundEffect : View {
	var body: some View {
		Circle()
			.fill(.red)
			.frame(
				width: UIScreen.main.bounds.width * 1.50,
				height: UIScreen.main.bounds.width * 1.50,
				alignment: .top)
			.position(
				x: UIScreen.main.bounds.width / 2,
				y: 50)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
