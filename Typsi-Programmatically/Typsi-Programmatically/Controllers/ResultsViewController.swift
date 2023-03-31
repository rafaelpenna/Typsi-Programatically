//
//  ResultsViewController.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let resultsScreen: ResultsScreen = ResultsScreen()
    
    var result = "0.0"
    var tip = 10
    var split = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = resultsScreen
        addElements()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func addElements(){
        view.addSubview(totalLabel)
        view.addSubview(settingsLabel)
        view.addSubview(recalculateButton)
    }
    
    lazy var totalLabel: UILabel = {
        let label: UILabel = resultsScreen.totalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var settingsLabel: UILabel = {
        let label: UILabel = resultsScreen.settingsLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button: UIButton = resultsScreen.recalculateButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        return button
    }()
    
    @objc func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
