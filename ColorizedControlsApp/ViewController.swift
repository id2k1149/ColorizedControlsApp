//
//  ViewController.swift
//  ColorizedControlsApp
//
//  Created by Max Franz Immelmann on 10/26/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(slider: redSlider, color: .red)
        redLabel.text = String(redSlider.value)
        
        setupSlider(slider: greenSlider, color: .green)
        greenLabel.text = String(greenSlider.value)
        
        setupSlider(slider: blueSlider, color: .blue)
        blueLabel.text = String(blueSlider.value)
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.cornerRadius = colorView.frame.height / 8
    }
    
    // MARK: - IB Actions
    @IBAction func redSliderAction() {
        sliderAction(label: redLabel, slider: redSlider, color: .red)
    }
    
    @IBAction func greenSliderAction() {
        sliderAction(label: greenLabel, slider: greenSlider, color: .green)
    }
    
    @IBAction func blueSliderAction() {
        sliderAction(label: blueLabel, slider: blueSlider, color: .blue)
    }
    
    // MARK: - Private Methods
    private func setupSlider(slider: UISlider, color: UIColor) {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 255
        slider.minimumTrackTintColor = color
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .white
    }
    
    private func sliderAction(label: UILabel, slider: UISlider, color: UIColor) {
        label.text = "\(round(slider.value * 100 / 255) / 100 )"
        
        switch color {
        case .red:
            colorView.backgroundColor =  UIColor(
                red: CGFloat(slider.value)/255,
                green: CGFloat(greenSlider.value)/255,
                blue: CGFloat(blueSlider.value)/255,
                alpha: 1)
        case .green:
            colorView.backgroundColor =  UIColor(
                red: CGFloat(redSlider.value)/255,
                green: CGFloat(slider.value)/255,
                blue: CGFloat(blueSlider.value)/255,
                alpha: 1)
        default:
            colorView.backgroundColor =  UIColor(
                red: CGFloat(redSlider.value)/255,
                green: CGFloat(greenSlider.value)/255,
                blue: CGFloat(slider.value)/255,
                alpha: 1)
        }
    }
}

