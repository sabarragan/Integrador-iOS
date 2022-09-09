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
        navBarConfiguration()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        title = "Random"
    }
    
    // MARK: - Navigation Bar Configuration
    func navBarConfiguration() {
        navBarAppearance.backgroundColor = UIColor(red: 0.38, green: 0.60, blue: 0.89, alpha: 1.00)
    }
}
