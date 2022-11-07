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
    
    var screenBackground: UIColor!
    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    var alpha: CGFloat = 1
    
    var delegate: MainViewControllerDelegate!
    
    // MARK: - LifeCicle view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.cornerRadius = colorView.frame.height / 8
        
        setColorForColorView(colorViewRGB: screenBackground)
        setSlider(with: screenBackground, for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setTextField(for: redTF, greenTF, blueTF)
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
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
        // force end edit TF
        view.endEditing(true)
        
        guard let newColorView = colorView.backgroundColor else { return }
        delegate.setBackground(for: newColorView)
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func setColorForColorView(colorViewRGB: UIColor) {
        colorViewRGB.getRed(&redColor, green: &greenColor, blue: &blueColor, alpha: &alpha)
        
        colorView.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: alpha
        )
    }
    
    private func setColorWithSliders() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setSlider(with screenRGB: UIColor, for sliders: UISlider...) {
        screenRGB.getRed(&redColor, green: &greenColor, blue: &blueColor, alpha: &alpha)
        
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                slider.value = Float(redColor)
            case greenSlider:
                slider.value = Float(greenColor)
            default:
                slider.value = Float(blueColor)            }
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
            redLabel.text = String(numberValue)
            setColorWithSliders()
        case greenTF:
            greenSlider.value = numberValue
            greenLabel.text = String(numberValue)
            setColorWithSliders()
        default:
            blueSlider.value = numberValue
            blueLabel.text = String(numberValue)
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
