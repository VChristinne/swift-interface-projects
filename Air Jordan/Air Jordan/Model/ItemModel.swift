import SwiftUI

struct ItemModel: Identifiable {
	var id = UUID().uuidString
	var images: [String]
	var title: String
	var price: String
	var color: Color
}

var items: [ItemModel] = [
	ItemModel(images: ["Red-White-One", "Red-White-Two"],
			  title: "Air Jordan 1 Retro High OG",
			  price: "€169.99",
			  color: Color("Red")),
	
	ItemModel(images: ["Black-Gray-One", "Black-Gray-Two"],
			  title: "Air Jordan 1 Retro High OG",
			  price: "€169.99",
			  color: Color("Black")),
	
	ItemModel(images: ["Gray-White-One", "Gray-White-Two"],
			  title: "Air Jordan 1 Retro High OG",
			  price: "€169.99",
			  color: Color("Gray")),
	
	ItemModel(images: ["Green-White-One", "Green-White-Two"],
			  title: "Air Jordan 1 Retro High OG",
			  price: "€169.99",
			  color: Color("Green")),
	
	ItemModel(images: ["Pattern-White-One", "Pattern-White-Two"],
			  title: "Air Jordan 1 Retro High OG",
			  price: "€169.99",
			  color: Color("Pattern")),
	
	ItemModel(images: ["White-Gold-One", "White-Gold-Two"],
			  title: "Air Jordan 1 Retro High OG",
			  price: "€169.99",
			  color: Color("Gold")),

]
