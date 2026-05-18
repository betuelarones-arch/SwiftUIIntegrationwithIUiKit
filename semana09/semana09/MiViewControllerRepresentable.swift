import SwiftUI

struct MiViewControllerRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> MiViewController {
        return MiViewController()
    }

    func updateUIViewController(_ uiViewController: MiViewController, context: Context) {

    }
}
