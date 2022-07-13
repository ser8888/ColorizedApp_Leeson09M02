//
//  ViewController.swift
//  HomeWork Module 2 Lesson 4
//
//  Created by Sergejs Tiselskis on 26/06/2022.
//

import UIKit

protocol ViewControllerDelegate {
    func sendChosenColor(_ chosenColor: UIColor )
}


class ViewController: UIViewController {
// MARK: - IB Outlets
    @IBOutlet var mainViewPanel: UIView!
    
    @IBOutlet var redLabelField: UILabel!
    @IBOutlet var greenLabelField: UILabel!
    @IBOutlet var blueLabelField: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var backgroundColorFromZeroScreen: UIColor!
    var delegate: ViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewPanel.layer.cornerRadius = 25
        setupAllSliders()
        setupAllLabels()
        
        mainViewPanel.backgroundColor = backgroundColorFromZeroScreen
        mainPanelColorsDecomposition()
 /*
        mainViewPanel.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha:  1
        
        )
*/
        
        
    }
//MARK: - IB Auctions
    
    @IBAction func redSliderAction() {
        redLabelField.text = "\(String(format: "%.2f",redSlider.value))"
        changeMainPanelColor()
    }
    @IBAction func greenSliderAction() {
        greenLabelField.text = "\(String(format: "%.2f", greenSlider.value))"
        changeMainPanelColor()
    }
    @IBAction func blueSliderAuction() {
        blueLabelField.text = "\(String(format: "%.2f", blueSlider.value))"
        changeMainPanelColor()
    }
    @IBAction func doneButtonTapped() {
        delegate?.sendChosenColor(mainViewPanel.backgroundColor ?? .white)
        dismiss(animated: false)
    }
    //MARK: - Private Methodes

    private func setupAllSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setupAllLabels() {
        redLabelField.text = String(redSlider.value)
        greenLabelField.text = String(greenSlider.value)
        blueLabelField.text = String(blueSlider.value)
    }
    
    private func changeMainPanelColor() {
        mainViewPanel.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value), alpha: 1
        )
    }
    
    private func mainPanelColorsDecomposition() {
        
        redSlider.value = Float(CIColor(color: backgroundColorFromZeroScreen).red)
        greenSlider.value = Float(CIColor(color: backgroundColorFromZeroScreen).green)
        blueSlider.value = Float(CIColor(color: backgroundColorFromZeroScreen).blue)
        setupAllLabels()
//        alpha.value = Float(CIColor(color: backgroundColorFromZeroScreen).alpha)
        }
    
    
}

