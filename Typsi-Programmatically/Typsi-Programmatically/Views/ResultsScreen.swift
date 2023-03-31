//
//  ResultsScreen.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class ResultsScreen: UIView {
    
    lazy var resultsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    lazy var background: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1).cgColor
        return label
    }()
    
    lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "56.32"
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people, with 10% tip."
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
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
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(background)
        addSubview(resultsTitleLabel)
        addSubview(totalAmountLabel)
        addSubview(settingsLabel)
        addSubview(recalculateButton)
    }
    
    
    private func constraintsScreen(){
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.heightAnchor.constraint(equalToConstant: 300),
            
            resultsTitleLabel.bottomAnchor.constraint(equalTo: background.centerYAnchor),
            resultsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            totalAmountLabel.topAnchor.constraint(equalTo: resultsTitleLabel.bottomAnchor),
            totalAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalAmountLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 20),
            
            settingsLabel.topAnchor.constraint(equalTo: background.bottomAnchor),
            settingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingsLabel.heightAnchor.constraint(equalToConstant: 117),
            
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
