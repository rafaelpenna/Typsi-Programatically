//
//  ViewController.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calculatorScreen: CalculatorScreen = CalculatorScreen()
    
    var numberToShare = 2
    var billValue = 0.0
    var billShared = 0.0
    var finalValue = "0.8"
    var tipPercent: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = calculatorScreen
        addElements()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func addElements(){
        view.addSubview(textField)
        view.addSubview(tipsStack)
        tipsStack.addSubview(zeroPctButton)
        tipsStack.addSubview(tenPctButton)
        tipsStack.addSubview(twentyPctButton)
        view.addSubview(splitStack)
        splitStack.addSubview(stepperButton)
        splitStack.addSubview(splitBillLabel)
        view.addSubview(calculateButton)
    }
    
    lazy var textField: UITextField = {
        let text: UITextField = calculatorScreen.billTextField
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var tipsStack: UIStackView = {
        let stack: UIStackView = calculatorScreen.tipsStack
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var zeroPctButton: UIButton = {
        let button: UIButton = calculatorScreen.zeroPct
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tipPct), for: .touchUpInside)
        return button
    }()
    
    lazy var tenPctButton: UIButton = {
        let button: UIButton = calculatorScreen.tenPct
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tipPct), for: .touchUpInside)
        return button
    }()
    
    lazy var twentyPctButton: UIButton = {
        let button: UIButton = calculatorScreen.twentyPct
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tipPct), for: .touchUpInside)
        return button
    }()
    
    lazy var splitStack: UIStackView = {
        let stack: UIStackView = calculatorScreen.splitStack
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var splitBillLabel: UILabel = {
        let label: UILabel = calculatorScreen.numberOfPeopleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stepperButton: UIStepper = {
        let button: UIStepper = calculatorScreen.stepper
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stepperChanged(_:)), for: .valueChanged)
        return button
    }()
    
    lazy var calculateButton: UIButton = {
        let button: UIButton = calculatorScreen.calculateButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        return button
    }()

    
    @objc func tipPct(_ sender: UIButton){
        textField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @objc func stepperChanged(_ sender: UIStepper!) {
        splitBillLabel.text = Int(sender.value).description
        print("is now \(Int(sender.value))")
    }
    
    @objc func calculatePressed(_ sender: UIButton){
        
        var tipValue: Double
        
        if zeroPctButton.isSelected == true {
            tipValue = 1.0
            tipPercent = 0
        } else if tenPctButton.isSelected == true {
            tipValue = 1.1
            tipPercent = 10
        } else {
            tipValue = 1.2
            tipPercent = 20
        }
        
        if textField.text != "" {
            billValue = Double(textField.text!)!
        }
        
        numberToShare = Int(splitBillLabel.text!)!
        billShared = billValue * tipValue / Double(numberToShare)
        finalValue = String(format: "%.2f", billShared)
        
        
        let resultsViewController = ResultsViewController()
        self.present(resultsViewController, animated: true, completion: nil)
        resultsViewController.result = finalValue
        resultsViewController.tip = tipPercent
        resultsViewController.split = numberToShare
        
        print(finalValue)
        print(numberToShare)
        print(tipPercent)
        
        textField.text = ""
        
    }

}

