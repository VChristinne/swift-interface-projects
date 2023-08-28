import SwiftUI

enum CalcBtn: String {
	case one = "1"
	case two = "2"
	case three = "3"
	case four = "4"
	case five = "5"
	case six = "6"
	case seven = "7"
	case eight = "8"
	case nine = "9"
	case zero = "0"
	case add = "+"
	case subtract = "-"
	case divide = "÷"
	case multiply = "x"
	case equal = "="
	case clear = "AC"
	case decimal = "."
	case percent = "%"
	case negative = "-/+"
	case none = ""
	
	var btnColor: Color {
		switch self {
			case .add, .subtract, .multiply, .divide, .equal:
				return Color("AppColor")
			case .clear, .negative, .percent:
				return .indigo
			default:
				return .black
		}
	}
}

enum Operation {
	case add, subtract, multiply, divide, percent, none
}

struct ContentView: View {

	@State var value = "0"
	@State var runningNumber = 0.0
	@State var currentOperation: Operation = .none
	
	// TODO: buttons sounds
	let buttons: [[CalcBtn]] = [
		[.clear, .negative, .percent, .divide],
		[.seven, .eight, .nine, .multiply],
		[.four, .five, .six, .subtract],
		[.one, .two, .three, .add],
		[.zero, .decimal, .equal],
	]
	
	var body: some View {
		ZStack {
			Color.white.edgesIgnoringSafeArea(.all)
			VStack {
				Spacer()
				HStack {
					Spacer()
					Text(value)
						.bold()
						.font(.system(size: 110))
						.foregroundColor(.black)
				}
				.padding()

				ForEach(buttons, id: \.self) { row in
					HStack(spacing: 12){
						ForEach(row, id: \.self) { item in
							Button(action: {
								self.didTap(button: item)
							}, label: {
								Text(item.rawValue)
									.font(.system(size: 55))
									.frame(
										width: self.btnWidth(item: item),
										height: self.btnHeight()
									)
									.background(item.btnColor)
									.foregroundColor(.white)
									.cornerRadius(self.btnWidth(item: item)/2)
							})
						}
					}
					.padding(.bottom, 3)
				}
			}
		}
	}
	
	func didTap(button: CalcBtn) {
		switch button {
			case .add, .subtract, .multiply, .divide, .equal, .percent:
				if button == .add {
					self.currentOperation = .add
					self.runningNumber = Double(self.value) ?? 0
				}
				else if button == .subtract {
					self.currentOperation = .subtract
					self.runningNumber = Double(self.value) ?? 0
				}
				else if button == .multiply {
					self.currentOperation = .multiply
					self.runningNumber = Double(self.value) ?? 0
				}
				else if button == .divide {
					self.currentOperation = .divide
					self.runningNumber = Double(self.value) ?? 0
				}
				else if button == .percent {
					self.currentOperation = .percent
					self.runningNumber = Double(self.value) ?? 0
				}
				else if button == .equal {
					let runningValue = self.runningNumber
					let currentValue = Double(self.value) ?? 0
					switch self.currentOperation {
						case .add:
							self.value = "\(runningValue + currentValue)"
						case .subtract:
							self.value = "\(runningValue - currentValue)"
						case .multiply:
							self.value = "\(runningValue * currentValue)"
						case .divide:
							self.value = "\(runningValue / currentValue)"
						case .percent:
							let percentValue = currentValue / 100.0
							self.value = "\(runningValue * percentValue)"
						case .none:
							break
					}
				}
				
				if button != .equal {
					self.value = "0"
				}
			case .clear:
				self.value = "0"
			case .negative:
				break
			default:
				let number = button.rawValue
				if self.value == "0" {
					value = number
				}
				else {
					self.value = "\(self.value)\(number)"
				}
		}
	}
	
	func formatNumber(_ number: Double) -> String {
		let formatter = NumberFormatter()
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 8
		return formatter.string(from: NSNumber(value: number)) ?? "0"
	}
	
	func btnWidth(item: CalcBtn) -> CGFloat {
		if item == .zero {
			return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
		}
		return (UIScreen.main.bounds.width - (8*8)) / 4
	}
	
	func btnHeight() -> CGFloat {
		return(UIScreen.main.bounds.width - (8*12)) / 5
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
