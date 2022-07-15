//
//  ZeroViewController.swift
//  ColorizedAppL09M02
//
//  Created by John Doe on 12/07/2022.
//

import UIKit

protocol ColorViewControllerDelegate {
    func sendChosenColor(_ chosenColor: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ColorViewController else { return }
        destination.delegate = self
        destination.sendColorFromMain = view.backgroundColor
    }
}
// MARK: - ViewControllerDelegate
extension MainViewController: ColorViewControllerDelegate {
    func sendChosenColor(_ chosenColor: UIColor) {
        view.backgroundColor = chosenColor
    }
}

