//
//  ViewController.swift
//  HomeWork Module 2 Lesson 4
//
//  Created by Sergejs Tiselskis on 26/06/2022.
//

import UIKit

class ColorViewController: UIViewController, UITextFieldDelegate {
    
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
    
    // MARK: - Public Properties
    var sendColorFromMain: UIColor!
    var delegate: ColorViewControllerDelegate!

    
    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        mainViewPanel.layer.cornerRadius = 25
//            setupAllSliders()
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        setColor()
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        
 //       mainViewPanel.backgroundColor = sendColorFromMain
        
//        mainPanelColorsDecomposition()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
//MARK: - IB Auctions
    @IBAction func rgbSlider(_ sender: Any) {
        
        setColor()           // из слайдеров нв фон
        setValue(for: redLabel, greenLabel, blueLabel)  //из слайдеров в лейблы
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
 
    @IBAction func doneButtonTapped() {
        delegate?.sendChosenColor(mainViewPanel.backgroundColor ?? .white)
        dismiss(animated: true)
    }

    
    //MARK: - Private Methodes
    
//    private func mainPanelColorsDecomposition() {
//
//        redSlider.value = Float(CIColor(color: sendColorFromMain).red)
//        greenSlider.value = Float(CIColor(color: sendColorFromMain).green)
//        blueSlider.value = Float(CIColor(color: sendColorFromMain).blue)
//
//        setColor()
// //       setupAllLabels()
//
//    }
    
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
    private func setValue(for sliders: UISlider...) {
        let ciColor = CIColor(color: sendColorFromMain)
        sliders.forEach { slider in
            switch slider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: redSlider)
            case greenTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
    //MARK: - Extension UITextFieldDelegate

extension ColorViewController: UITextViewDelegate {
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            guard let text = textField.text else { return }
            
            if let currentValue = Float(text) {
                switch textField {
                case redTextField:
                    redSlider.setValue(currentValue, animated: true)
                    setValue(for: redLabel)
                case greenTextField:
                    greenSlider.setValue(currentValue, animated: true)
                default:
                    blueSlider.setValue(currentValue, animated: true)
                }
                setColor()
                return
            }
            
            showAlert(title: "Wrong Format!", message: "Please, enter correcct value")
        }
   
        func textFieldDidBeginEditing(_ textField: UITextField) {
            let keyboardToolbar = UIToolbar()
            keyboardToolbar.sizeToFit()
            textField.inputAccessoryView = keyboardToolbar
            
            let doneButton = UIBarButtonItem(
                barButtonSystemItem: .done,
                target: self,
                action: #selector(didTapDone)
            )
             let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
             )
                
            keyboardToolbar.items = [flexBarButton, doneButton]
                 
        }
    }



