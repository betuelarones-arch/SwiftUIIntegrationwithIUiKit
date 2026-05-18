import UIKit

class Vista2ViewController: UIViewController {

    let capitalTextField = UITextField()
    let tasaTextField = UITextField()
    let anosTextField = UITextField()
    let resultadoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Vista 2 - Interés Compuesto"

        configurarTextField(capitalTextField, placeholder: "Monto inicial (capital)")
        configurarTextField(tasaTextField, placeholder: "Tasa de interés anual (%)")
        configurarTextField(anosTextField, placeholder: "Número de años")

        let calcularButton = UIButton(type: .system)
        calcularButton.setTitle("🔢 Calcular Monto Final", for: .normal)
        calcularButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        calcularButton.addTarget(self, action: #selector(calcularInteres), for: .touchUpInside)

        resultadoLabel.text = "Monto final: S/ 0.00"
        resultadoLabel.font = .systemFont(ofSize: 20)
        resultadoLabel.textAlignment = .center

        let volverButton = UIButton(type: .system)
        volverButton.setTitle("⬅️ Volver al menú", for: .normal)
        volverButton.titleLabel?.font = .systemFont(ofSize: 16)
        volverButton.addTarget(self, action: #selector(volverAlMenu), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [
            capitalTextField,
            tasaTextField,
            anosTextField,
            calcularButton,
            resultadoLabel,
            volverButton
        ])

        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            capitalTextField.widthAnchor.constraint(equalToConstant: 250),
            tasaTextField.widthAnchor.constraint(equalToConstant: 250),
            anosTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }

    private func configurarTextField(_ textField: UITextField, placeholder: String) {
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
    }

    @objc func calcularInteres() {
        guard let textoCapital = capitalTextField.text,
              let textoTasa = tasaTextField.text,
              let textoAnos = anosTextField.text,
              let capital = Double(textoCapital),
              let tasa = Double(textoTasa),
              let anos = Double(textoAnos) else {
            resultadoLabel.text = "❌ Ingrese datos válidos"
            return
        }

        let montoFinal = capital * pow((1 + (tasa / 100)), anos)
        resultadoLabel.text = String(format: "Monto final: S/ %.2f", montoFinal)
    }

    @objc func volverAlMenu() {
        navigationController?.popViewController(animated: true)
    }
}
