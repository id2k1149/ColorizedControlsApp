//
//  StartViewController.swift
//  ColorizedControlsApp
//
//  Created by Max Franz Immelmann on 11/6/22.
//

import UIKit

protocol MainViewControllerDelegate {
    func setBackground(for backGroundRGB: UIColor)
}

class StartViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? MainViewController else { return }
        mainVC.screenBackground = view.backgroundColor
        mainVC.delegate = self
    }
}

// MARK - MainViewControllerDelegate
extension StartViewController: MainViewControllerDelegate {
    func setBackground(for backGroundRGB: UIColor) {
        view.backgroundColor = backGroundRGB
    }
}
