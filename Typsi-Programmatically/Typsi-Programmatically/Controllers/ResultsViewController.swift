//
//  ResultsViewController.swift
//  Typsi-Programmatically
//
//  Created by Rafael Penna on 31/03/23.
//

import UIKit

class ResultsViewController: UIViewController {

    let resultsScreen: ResultsScreen = ResultsScreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = resultsScreen
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }


}
