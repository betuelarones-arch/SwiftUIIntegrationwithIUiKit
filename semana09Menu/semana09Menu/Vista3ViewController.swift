import UIKit

class Vista3ViewController: UIViewController {

    let montoTextField = UITextField()
    let teaTextField = UITextField()
    let plazoTextField = UITextField()
    let cuotaLabel = UILabel()
    let interesLabel = UILabel()
    let totalLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Simulador de Préstamos"

        configurarTextField(montoTextField, placeholder: "Monto del préstamo (S/)")
        configurarTextField(teaTextField, placeholder: "Tasa de interés anual (TEA %)")
        configurarTextField(plazoTextField, placeholder: "Plazo en meses")

        let calcularButton = UIButton(type: .system)
        calcularButton.setTitle("🏦 Simular Préstamo", for: .normal)
        calcularButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        calcularButton.addTarget(self, action: #selector(calcularPrestamo), for: .touchUpInside)

        cuotaLabel.text = "Cuota mensual: S/ 0.00"
        cuotaLabel.font = .systemFont(ofSize: 18)
        cuotaLabel.textAlignment = .center

        interesLabel.text = "Interés total: S/ 0.00"
        interesLabel.font = .systemFont(ofSize: 18)
        interesLabel.textAlignment = .center

        totalLabel.text = "Monto total a pagar: S/ 0.00"
        totalLabel.font = .boldSystemFont(ofSize: 18)
        totalLabel.textAlignment = .center

        let volverButton = UIButton(type: .system)
        volverButton.setTitle("⬅️ Volver al menú", for: .normal)
        volverButton.titleLabel?.font = .systemFont(ofSize: 16)
        volverButton.addTarget(self, action: #selector(volverAlMenu), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [
            montoTextField,
            teaTextField,
            plazoTextField,
            calcularButton,
            cuotaLabel,
            interesLabel,
            totalLabel,
            volverButton
        ])

        stack.axis = .vertical
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            montoTextField.widthAnchor.constraint(equalToConstant: 260),
            teaTextField.widthAnchor.constraint(equalToConstant: 260),
            plazoTextField.widthAnchor.constraint(equalToConstant: 260)
        ])
    }

    private func configurarTextField(_ textField: UITextField, placeholder: String) {
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
    }

    @objc func calcularPrestamo() {
        guard let textoMonto = montoTextField.text,
              let textoTea = teaTextField.text,
              let textoPlazo = plazoTextField.text,
              let monto = Double(textoMonto),
              let tea = Double(textoTea),
              let n = Double(textoPlazo), n > 0 else {
            cuotaLabel.text = "❌ Ingrese datos válidos"
            interesLabel.text = ""
            totalLabel.text = ""
            return
        }

        let i = tea / 12 / 100

        let factor = pow(1 + i, n)
        let cuota = monto * (i * factor) / (factor - 1)
        let montoTotal = cuota * n
        let interesTotal = montoTotal - monto

        cuotaLabel.text = String(format: "Cuota mensual: S/ %.2f", cuota)
        interesLabel.text = String(format: "Interés total: S/ %.2f", interesTotal)
        totalLabel.text = String(format: "Monto total a pagar: S/ %.2f", montoTotal)
    }

    @objc func volverAlMenu() {
        navigationController?.popViewController(animated: true)
    }
}
