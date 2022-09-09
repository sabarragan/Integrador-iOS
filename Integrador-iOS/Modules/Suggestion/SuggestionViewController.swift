//
//  SuggestionViewController.swift
//  Integrador-iOS
//
//  Created by Ana Lucia Blanco Cervantes on 06/09/22.
//

import UIKit

// MARK: - Option selection
enum ActivityType {
    case random
    case category
}

class SuggestionViewController: UIViewController {
    // MARK: - Properties
    private lazy var sView = SuggestionView()

    // MARK: - Life Cycle
    override func loadView() {
        view = sView
        sView.activityType = .category
        sView.activityText = "Hi, I´m an example"
        sView.participantsCount = 2
        sView.price = 0.6
        sView.categoryName = "Educational"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setButtonActions()
    }
    
    private func setButtonActions() {
        sView.setTargetForTryAnotherButton(target: self, action: #selector(backButtonClicked))
        sView.setTargetForBackButton(target: self, action: #selector(didTapTryAnotherButton))
    }
    
    // MARK: - Actions
    @objc func backButtonClicked(_ sender: UIButton) {
        print("backButtonClicked")
    }
    
    @objc func didTapTryAnotherButton(_ sender: UIButton) {
        print("didTapTryAnotherButton")
    }
}
