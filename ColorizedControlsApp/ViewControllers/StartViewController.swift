//
//  StartViewController.swift
//  ColorizedControlsApp
//
//  Created by Max Franz Immelmann on 11/6/22.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var screenBackgroundLabel: UIView!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenBackgroundLabel.backgroundColor?
            .getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
    }
}
