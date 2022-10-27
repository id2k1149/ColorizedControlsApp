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
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupMainLabel()
        setupRedSlider()
        
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
        
    }
    
    // MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = String(redSlider.value)
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupRedSlider() {
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .yellow
        redSlider.maximumTrackTintColor = .red
        redSlider.thumbTintColor = .blue
    }


}

