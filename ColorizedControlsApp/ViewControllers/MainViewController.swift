//
//  ViewController.swift
//  ColorizedControlsApp
//
//  Created by Max Franz Immelmann on 10/26/22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - LifeCicle view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.cornerRadius = colorView.frame.height / 8
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: - IB Actions
    @IBAction func rgbSlider(_ sender: UISlider) {
    }
    
    // MARK: - Private Methods
    private func sliderAction(label: UILabel, slider: UISlider) {
        label.text = "\(round(slider.value * 100 / 255) / 100 )"
        
        switch label {
        case redLabel:
            colorView.backgroundColor =  UIColor(
                red: CGFloat(slider.value) / 255,
                green: CGFloat(greenSlider.value) / 255,
                blue: CGFloat(blueSlider.value) / 255,
                alpha: 1)
        case greenLabel:
            colorView.backgroundColor =  UIColor(
                red: CGFloat(redSlider.value) / 255,
                green: CGFloat(slider.value) / 255,
                blue: CGFloat(blueSlider.value) / 255,
                alpha: 1)
        default:
            colorView.backgroundColor =  UIColor(
                red: CGFloat(redSlider.value) / 255,
                green: CGFloat(greenSlider.value) / 255,
                blue: CGFloat(slider.value) / 255,
                alpha: 1)
        }
    }
}

