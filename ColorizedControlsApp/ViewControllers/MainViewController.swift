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
        
        setColorForColorView(screenRGB: screenBackground)
        setSlider(with: screenBackground, for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColorWithSliders()
        switch sender {
            case redSlider: setValue(for: redLabel)
            case greenSlider: setValue(for: greenLabel)
            default: setValue(for: blueLabel)
        }
    }
    
    @IBAction func doneButtonTaped(_ sender: UIButton) {
        guard let newColorView = colorView.backgroundColor else { return }
        delegate.setBackground(for: newColorView)
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func setColorForColorView(screenRGB: UIColor) {
        screenRGB.getRed(&redColor, green: &greenColor, blue: &blueColor, alpha: &alpha)
        
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
    
    private func getValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
