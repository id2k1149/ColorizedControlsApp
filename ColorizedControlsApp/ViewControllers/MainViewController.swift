//
//  ViewController.swift
//  ColorizedControlsApp
//
//  Created by Max Franz Immelmann on 10/26/22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    // MARK: - Public Properties
    var screenBackground: UIColor!
    var delegate: MainViewControllerDelegate!
    
    // MARK: - LifeCicle view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.cornerRadius = colorView.frame.height / 8
        
        colorView.backgroundColor = screenBackground
        
        setSlider(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setTextField(for: redTF, greenTF, blueTF)
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
    }
    
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColorWithSliders()
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setTextField(for: redTF)
        case greenSlider:
            setValue(for: greenLabel)
            setTextField(for: greenTF)
        default:
            setValue(for: blueLabel)
            setTextField(for: blueTF)
        }
    }
    
    @IBAction func doneButtonTaped(_ sender: UIButton) {
        delegate.setBackground(for: colorView.backgroundColor ?? .systemBackground)
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func setColorWithSliders() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setSlider(for sliders: UISlider...) {
        let ciColor = CIColor(color: screenBackground)
        
        sliders.forEach { slider in
            switch slider {
            case redSlider: slider.value = Float(ciColor.red)
            case greenSlider: slider.value = Float(ciColor.green)
            default: slider.value = Float(ciColor.blue)
            }
        }
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = getValue(from: redSlider)
            case greenLabel:
                label.text = getValue(from: greenSlider)
            default:
                label.text = getValue(from: blueSlider)
            }
        }
    }
    
    private func setTextField(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF:
                textField.text = getValue(from: redSlider)
                textField.keyboardType = .decimalPad
                textField.inputAccessoryView = toolBar()
            case greenTF:
                textField.text = getValue(from: greenSlider)
                textField.keyboardType = .decimalPad
                textField.inputAccessoryView = toolBar()
            default:
                textField.text = getValue(from: blueSlider)
                textField.keyboardType = .decimalPad
                textField.inputAccessoryView = toolBar()
            }
        }
    }
    
    private func getValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }

        switch textField {
        case redTF:
            redSlider.value = numberValue
            redLabel.text = getValue(from: redSlider)
            setColorWithSliders()
        case greenTF:
            greenSlider.value = numberValue
            greenLabel.text = getValue(from: greenSlider)
            setColorWithSliders()
        default:
            blueSlider.value = numberValue
            blueLabel.text = getValue(from: blueSlider)
            setColorWithSliders()
        }
    }
}

extension UIViewController{
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        let doneButton = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(onClickDoneButton))
        doneButton.tintColor = .white
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }

    @objc func onClickDoneButton(){
        view.endEditing(true)
    }
}
