//
//  CalculatorScreen.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class CalculatorScreen: UIView {
    
    lazy var enterBillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter bill total"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    lazy var billTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "e.g. 123.56"
        text.font = UIFont.systemFont(ofSize: 40)
        text.textColor = .lightGray
        text.textAlignment = .center
        return text
    }()
    
    lazy var background: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1).cgColor
        return label
    }()
    
    lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Tip"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var tipsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var zeroPct: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.isEnabled = true
        button.backgroundColor = .none
        button.setTitleColor(UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1), for: .normal)
        return button
    }()
    
    lazy var tenPct: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitleColor(UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1), for: .normal)
        button.isEnabled = true
        return button
    }()
    
    lazy var twentyPct: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("20%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitleColor(UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1), for: .normal)
        button.isEnabled = true
        return button
    }()
    
    lazy var splitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Split"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var numberOfPeopleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 2
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue = 1
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.isEnabled = true
        stepper.isUserInteractionEnabled = true
        stepper.wraps = true
        return stepper
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.contentHorizontalAlignment = .center
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
        button.isEnabled = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        constraintsScreen()
        setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackgroundColor() {
        backgroundColor = .white
    }
    
    private func addElements(){
        addSubview(enterBillLabel)
        addSubview(billTextField)
        addSubview(background)
        addSubview(tipLabel)
        addSubview(tipsStack)
        tipsStack.addSubview(zeroPct)
        tipsStack.addSubview(tenPct)
        tipsStack.addSubview(twentyPct)
        addSubview(splitLabel)
        addSubview(numberOfPeopleLabel)
        addSubview(stepper)
        addSubview(calculateButton)
    }
    
    private func constraintsScreen(){
        NSLayoutConstraint.activate([
            
            enterBillLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            enterBillLabel.heightAnchor.constraint(equalToConstant: 30),
            enterBillLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            billTextField.topAnchor.constraint(equalTo: enterBillLabel.bottomAnchor, constant: 30),
            billTextField.heightAnchor.constraint(equalToConstant: 50),
            billTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            background.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: 40),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tipLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            tipLabel.heightAnchor.constraint(equalToConstant: 30),
            tipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            tipsStack.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 10),
            tipsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            tipsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            tipsStack.heightAnchor.constraint(equalToConstant: 60),
            
            tenPct.centerXAnchor.constraint(equalTo: tipsStack.centerXAnchor),
            
            zeroPct.trailingAnchor.constraint(equalTo: tenPct.leadingAnchor, constant: -47),
            twentyPct.leadingAnchor.constraint(equalTo: tenPct.trailingAnchor, constant: 47),
            
            splitLabel.topAnchor.constraint(equalTo: tipsStack.bottomAnchor, constant: 20),
            splitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            splitLabel.heightAnchor.constraint(equalToConstant: 30),
            
            numberOfPeopleLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -39),
            numberOfPeopleLabel.centerYAnchor.constraint(equalTo: splitLabel.bottomAnchor, constant: 25),
            stepper.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 39),
            stepper.centerYAnchor.constraint(equalTo: splitLabel.bottomAnchor, constant: 25),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
