//
//  TermsViewController.swift
//  Integrador-iOS
//
//  Created by Cristian Emmanuel Rivero on 06/09/2022.
//

import UIKit

class TermsViewController: UIViewController {
    
    override func loadView() {
        self.view = TermsView()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.31, green: 0.28, blue: 0.94, alpha: 1.00)
        title = "Terms and Conditions"
    }
}
