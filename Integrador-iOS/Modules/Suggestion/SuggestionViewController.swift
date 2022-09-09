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
    
    var activityType: ActivityType? {
        didSet {
            suggestionView.activityType = activityType
        }
    }
    
    var actvityText: String? {
        didSet{
            suggestionView.activityText = actvityText
        }
    }
    
    var participantsCount: Int? {
        didSet {
            suggestionView.participantsCount = participantsCount
        }
    }
    
    var price: Double? {
        didSet {
            suggestionView.price = price
        }
    }
    
    var categoryName: String? {
        didSet {
            suggestionView.categoryName = categoryName ?? ""
        }
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = suggestionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setButtonActions()
    }
    
    func setTargetForTryAnotherButton(target: Any?, action: Selector) {
        suggestionView.setTargetForTryAnotherButton(target: target, action: action)
        self.reloadInputViews()
    }
    
    private func setButtonActions() {
//        suggestionView.setTargetForTryAnotherButton(target: self, action: #selector(didTapTryAnotherButton))
        suggestionView.setTargetForBackButton(target: self, action: #selector(backButtonClicked(_:)))
    }
    
    // MARK: - Actions
    @objc func backButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
