import UIKit
import MapKit

class MiMapaViewController: UIViewController {

    let mapa = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        mapa.frame = view.bounds
        mapa.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapa)

        let coordenada = CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428)
        let region = MKCoordinateRegion(center: coordenada, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapa.setRegion(region, animated: true)
    }
}
