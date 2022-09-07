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
        view.backgroundColor = UIColor(named: "background")
        title = "Terms and Conditions"
    }
}
