//
//  SuggestionViewController.swift
//  Integrador-iOS
//
//  Created by Ana Lucia Blanco Cervantes on 06/09/22.
//

import UIKit

// MARK: - Option selection
enum activityType {
    case random
    case category
}

class SuggestionViewController: UIViewController {
    // MARK: - Properties
    private let navBarAppearance = UINavigationBarAppearance()
    private var suggestionView = SuggestionView()

    // MARK: - Life Cycle
    override func loadView() {
        view = suggestionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarConfiguration()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        title = "Test"
    }
    
    // MARK: - Navigation Bar Configuration
    func navBarConfiguration() {
        navBarAppearance.backgroundColor = UIColor(red: 0.38, green: 0.60, blue: 0.89, alpha: 1.00)
        navBarAppearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 32)]
    }
}
