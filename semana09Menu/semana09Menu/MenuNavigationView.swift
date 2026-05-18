import SwiftUI

struct MenuNavegacionView: View {
    var onSelect: (String) -> Void

    var body: some View {
        Menu {
            Button("Vista 1") { onSelect("vista1") }
            Button("Vista 2") { onSelect("vista2") }
            Button("Vista 3") { onSelect("vista3") }
        } label: {
            Text("Ir a vista")
                .font(.title2)
                .padding()
        }
    }
}

#Preview {
    MenuNavegacionView(onSelect: { _ in })
}
