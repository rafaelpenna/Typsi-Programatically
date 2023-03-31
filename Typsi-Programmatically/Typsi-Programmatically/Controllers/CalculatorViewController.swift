//
//  ViewController.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calculatorScreen: CalculatorScreen = CalculatorScreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = calculatorScreen
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }


}

