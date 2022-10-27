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
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        setupRedSlider()
        setupRedLabel()
        
        setupGreenSlider()
        setupGreenLabel()
        
        setupBlueSlider()
        setupBlueLabel()
        
        setupMainLabel()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.cornerRadius = colorView.frame.height / 8
        
    }
    
    // MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .green
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func redSliderAction() {
//        sliderAction(label: redLabel, slider: redSlider)
        redLabel.text = "\(round(redSlider.value * 100 / 255) / 100 )"
        colorView.backgroundColor =  UIColor(
            red: CGFloat(redSlider.value)/255,
            green: 0,
            blue: 0,
            alpha: 1)
        
    }
    
    @IBAction func greenSliderAction() {
//        sliderAction(label: greenLabel, slider: greenSlider)
        greenLabel.text = "\(round(greenSlider.value * 100 / 255) / 100 )"
        colorView.backgroundColor =  UIColor(
            red: 0,
            green: CGFloat(greenSlider.value)/255,
            blue: 0,
            alpha: 1)
        
    }
    
    @IBAction func blueSliderAction() {
//        sliderAction(label: blueLabel, slider: blueSlider)
        blueLabel.text = "\(round(blueSlider.value * 100 / 255) / 100 )"
        colorView.backgroundColor =  UIColor(
            red: 0,
            green: 0,
            blue: CGFloat(blueSlider.value)/255,
            alpha: 1)
        
    }
    
    // MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = String(redSlider.value)
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupRedLabel() {
        redLabel.text = String(redSlider.value)
        
    }
    
    private func setupRedSlider() {
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .gray
        redSlider.thumbTintColor = .white
    }
    
    private func setupGreenLabel() {
        greenLabel.text = String(greenSlider.value)
        
    }
    
    private func setupGreenSlider() {
        greenSlider.value = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .gray
        greenSlider.thumbTintColor = .white
    }
    
    
    private func setupBlueLabel() {
        blueLabel.text = String(blueSlider.value)
        
    }
    
    private func setupBlueSlider() {
        blueSlider.value = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .gray
        blueSlider.thumbTintColor = .white
    }
    
//    private func sliderAction(label: UILabel, slider: UISlider) {
//        label.text = "\(round(slider.value * 100 / 255) / 100 )"
//        colorView.backgroundColor =  UIColor(
//            red: CGFloat(slider.value)/255,
//            green: 0,
//            blue: 0,
//            alpha: 1)
//    }


}

