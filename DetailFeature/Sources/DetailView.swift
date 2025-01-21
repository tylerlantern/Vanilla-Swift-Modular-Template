import SwiftUI

public struct DetailView : View {
	
	let title : String
	
	public init(title : String){
		self.title = title
	}
	
	public var body: some View {
		Text("Hello, Home's Detail!")
	}
	
}
