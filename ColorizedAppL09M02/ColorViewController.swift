//
//  ViewController.swift
//  HomeWork Module 2 Lesson 4
//
//  Created by Sergejs Tiselskis on 26/06/2022.
//

import UIKit

//protocol ViewControllerDelegate {
//    func sendChosenColor(_ chosenColor: UIColor )
//}
class ColorViewController: UIViewController {
// MARK: - IB Outlets
    @IBOutlet var mainViewPanel: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    var sendColorFromMain: UIColor!
    var delegate: ColorViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewPanel.layer.cornerRadius = 25
        setupAllSliders()
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        
        
        mainViewPanel.backgroundColor = sendColorFromMain
        
        mainPanelColorsDecomposition()
        
//        redTextField.delegate = self
//        greenTextField.delegate = self
//        blueTextField.delegate = self
        

    }
//MARK: - IB Auctions
    @IBAction func rgbSlider(_ sender: Any) {
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
 
    @IBAction func doneButtonTapped() {
        delegate?.sendChosenColor(mainViewPanel.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    //MARK: - Private Methodes

    private func setupAllSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    private func setupAllLabels() {
        redLabel.text = "\(String(format: "%.2f",redSlider.value))"
        greenLabel.text = "\(String(format: "%.2f", greenSlider.value))"
        blueLabel.text = "\(String(format: "%.2f", blueSlider.value))"
        
//        redLabelField.text = String(redSlider.value)
//        greenLabelField.text = String(greenSlider.value)
//        blueLabelField.text = String(blueSlider.value)
    }
//    private func changeMainPanelColor() {
//        mainViewPanel.backgroundColor = UIColor(red: CGFloat(redSlider.value),
//                            green: CGFloat(greenSlider.value),
//                            blue: CGFloat(blueSlider.value), alpha: 1
//        )
//    }
    
    private func mainPanelColorsDecomposition() {
        
        redSlider.value = Float(CIColor(color: sendColorFromMain).red)
        greenSlider.value = Float(CIColor(color: sendColorFromMain).green)
        blueSlider.value = Float(CIColor(color: sendColorFromMain).blue)
        
        setColor()
       // setupAllLabels()

    }
    
    private func setColor() {
        mainViewPanel.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
  
    

    
    
    }
        /*
    //MARK: - Extension UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
   
    }
    
}
 */
