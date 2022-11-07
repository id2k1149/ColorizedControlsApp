//
//  StartViewController.swift
//  ColorizedControlsApp
//
//  Created by Max Franz Immelmann on 11/6/22.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var screenBackgroundLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? MainViewController else { return }
        mainVC.screenBackground = self.view.backgroundColor
    }
}
