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
    private let navBarAppearance = UINavigationBarAppearance()
    private lazy var suggestionView = SuggestionView()
    
    var actvityText: String? {
        didSet{
            suggestionView.activityText = actvityText
        }
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = suggestionView
        suggestionView.activityType = .random
//        suggestionView.activityText = "Hi, I´m an example"
        suggestionView.participantsCount = 2
        suggestionView.price = 0.6
        suggestionView.categoryName = "Adventure"
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
