//
//  ZeroViewController.swift
//  ColorizedAppL09M02
//
//  Created by John Doe on 12/07/2022.
//

import UIKit

class ZeroViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showColorSettingIdentifier" else { return }
        guard let destination = segue.destination as? ViewController else { return }
        destination.delegate = self
        destination.backgroundColorFromZeroScreen = view.backgroundColor
    }
}
// MARK: - ViewControllerDelegate
extension ZeroViewController: ViewControllerDelegate {
    func sendChosenColor(_ chosenColor: UIColor) {
        view.backgroundColor = chosenColor
    }
}

