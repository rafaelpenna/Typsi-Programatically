//
//  ViewController.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calculatorScreen: CalculatorScreen = CalculatorScreen()
    
    var numberPeopleToShare = 2
    var billValue = 0.0
    var billAfterShared = 0.0
    var finalValuePresentation = "0.8"
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
        view.addSubview(splitBillLabel)
        view.addSubview(stepperButton)
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
    
    lazy var splitBillLabel: UILabel = {
        let label: UILabel = calculatorScreen.numberOfPeopleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stepperButton: UIStepper = {
        let button: UIStepper = calculatorScreen.stepper
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
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
        
        if sender.isSelected == true {
            sender.backgroundColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
            sender.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        }
        
        if zeroPctButton.isSelected == true {
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else {
            zeroTipNotSelected()
        }
        
        if tenPctButton.isSelected == true {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else {
            tenTipNotSelected()
        }
        
        if twentyPctButton.isSelected == true {
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        } else {
            twentyTipNotSelected()
        }
    }

    private func zeroTipNotSelected() {
        zeroPctButton.backgroundColor = .none
        zeroPctButton.setTitleColor(UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1), for: .normal)
    }
    
    private func tenTipNotSelected() {
        tenPctButton.backgroundColor = .none
        tenPctButton.setTitleColor(UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1), for: .normal)
    }
    
    private func twentyTipNotSelected() {
        twentyPctButton.backgroundColor = .none
        twentyPctButton.setTitleColor(UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1), for: .normal)
    }
    
    
    @objc func stepperChanged(_ sender: UIStepper!) {
        splitBillLabel.text = Int(sender.value).description
    }
    
    @objc func calculatePressed(_ sender: UIButton){
        textFieldIsEmpty()
        finalValueCalculate()
        sendDataToResultsViewContyroller()
        resetTextField()
    }
    
    private func textFieldIsEmpty() {
        if textField.text != "" {
            billValue = Double(textField.text!)!
        } else {
            billValue = 0
        }
    }
    
    private func finalValueCalculate() {
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
        
        numberPeopleToShare = Int(splitBillLabel.text!)!
        billAfterShared = billValue * tipValue / Double(numberPeopleToShare)
        finalValuePresentation = String(format: "%.2f", billAfterShared)
    }
    
    private func sendDataToResultsViewContyroller() {
        let resultsViewController = ResultsViewController()
        self.navigationController?.pushViewController(resultsViewController, animated: true)
        resultsViewController.result = finalValuePresentation
        resultsViewController.tip = tipPercent
        resultsViewController.split = numberPeopleToShare
    }
    
    private func resetTextField() {
        textField.text = ""
    }
}

