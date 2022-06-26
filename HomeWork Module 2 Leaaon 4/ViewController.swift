//
//  ViewController.swift
//  HomeWork Module 2 Leaaon 4
//
//  Created by John Doe on 26/06/2022.
//

import UIKit

class ViewController: UIViewController {
// MARK: - IB Outlets
    @IBOutlet var mainViewPanel: UIView!
    
    @IBOutlet var redLabelField: UILabel!
    @IBOutlet var greenLabelField: UILabel!
    @IBOutlet var blueLabelField: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewPanel.layer.cornerRadius = 25
        setupAllSliders()
        setupAllLabels()
        
        
        
        
    }
//MARK: - IB Auctions
    
    @IBAction func redSliderAction() {
        redLabelField.text = "\(String(format: "%.2f",redSlider.value))"
    }
    @IBAction func greenSliderAction() {
        greenLabelField.text = "\(String(format: "%.2f", greenSlider.value))"
    }
    @IBAction func blueSliderAuction() {
        blueLabelField.text = "\(String(format: "%.2f", blueSlider.value))"
    }
    
    
    
    
//MARK: - Private Methodes

    private func setupAllSliders() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setupAllLabels() {
        redLabelField.text = String(redSlider.value)
        greenLabelField.text = String(greenSlider.value)
        blueLabelField.text = String(blueSlider.value)
    }
    
    
    
}

