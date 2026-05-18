import SwiftUI
import MapKit

struct MiMapaRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> MiMapaViewController {
        return MiMapaViewController()
    }

    func updateUIViewController(_ uiViewController: MiMapaViewController, context: Context) {
    }
}
