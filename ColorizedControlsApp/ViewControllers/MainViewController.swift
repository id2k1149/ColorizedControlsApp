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
    
    // MARK: - LifeCicle view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.cornerRadius = colorView.frame.height / 8
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    // MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
            case redSlider: setValue(for: redLabel)
            case greenSlider: setValue(for: greenLabel)
            default: setValue(for: blueLabel)
        }
    }
    
    // MARK: - Private methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
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
