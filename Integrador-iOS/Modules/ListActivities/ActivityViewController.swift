//
//  ActivityViewController.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 7/09/22.
//

import Foundation
import UIKit

class ActivityViewController: UIViewController, ActivityManagerDelegate {
    
    var suggestion = SuggestionViewController()
    
    var taskedActivity = TaskManager()
    
    func didUpdateWeather(tasked: ActivityData) {
        DispatchQueue.main.async {
            self.suggestion.actvityText = tasked.activity
            self.suggestion.participantsCount = tasked.participants
            self.suggestion.price = tasked.price
            self.suggestion.categoryName = tasked.type
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    var activities: [String] = Activities().activities
    
    private lazy var tableView: UITableView = {
        let activitiesTable = UITableView()
        activitiesTable.translatesAutoresizingMaskIntoConstraints = false
        activitiesTable.backgroundColor = UIColor(named: "background")
        return activitiesTable
    }()
    
    private lazy var blueView: UIView = {
       let blueView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor(named: "text")
        blueView.heightAnchor.constraint(equalToConstant: 120).isActive = true
   
        return blueView
    }()
    
    private lazy var activityTitle: UILabel = {
        let activityTitle = UILabel()
        activityTitle.translatesAutoresizingMaskIntoConstraints = false
        activityTitle.textColor = .white
        activityTitle.text = "Activities"
        activityTitle.font = .systemFont(ofSize: 30, weight: .bold)
        activityTitle.textAlignment = .center
        return activityTitle
    }()
    
    private lazy var randomButton: UIButton = {
       let randomButton = UIButton()
        randomButton.translatesAutoresizingMaskIntoConstraints = false
        randomButton.setImage(UIImage(named: "random-icon-white"), for: .normal)
        randomButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        randomButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        randomButton.addTarget(self, action: #selector(self.randomButtonClicked(_ :)), for: .touchUpInside)
        return randomButton
    }()
    
    private lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"),for: .normal)
        backButton.tintColor = .white
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.addTarget(self, action: #selector(self.backButtonClicked(_ :)), for: .touchUpInside)
        return backButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskedActivity.delegate = self
        
        navigationController?.isNavigationBarHidden = true
        setupView()
        setupConstraints()
        
        suggestion.setTargetForTryAnotherButton(target: self, action: #selector(didTapTryAnotherButton(_:)))
        
    }
    
    @objc func backButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func randomButtonClicked(_ sender: UIButton) {
        suggestion.activityType = .random
        taskedActivity.performRequest()
        self.navigationController?.pushViewController(suggestion, animated: true)
    }
    
    @objc func didTapTryAnotherButton(_ sender: UIButton) {
        taskedActivity.performRequest()
    }
    
    private func setupView() {
                
       
        self.view.addSubview(blueView)
        self.view.addSubview(activityTitle)
        self.view.addSubview(randomButton)
        self.view.addSubview(backButton)
        self.view.addSubview(tableView)
            
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: String(describing: ActivityCell.self))
        
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            
            blueView.topAnchor.constraint(equalTo: self.view.topAnchor),
            blueView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            activityTitle.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 60),
            activityTitle.centerXAnchor.constraint(equalTo: blueView.centerXAnchor),
            
            randomButton.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 60),
            randomButton.leadingAnchor.constraint(equalTo: activityTitle.trailingAnchor, constant: 40),
            
            
            backButton.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 20),
            
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: blueView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
    }
    
}

extension ActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        suggestion.activityType = .category
        
        let acticitySelected = self.activities[indexPath.row] // Actividad Seleccionada, se debe enviar a las vista que hizo Ana.
        taskedActivity.performRequestForCategory(acticitySelected.lowercased())
        
        self.navigationController?.pushViewController(suggestion, animated: true)
    }
}

extension ActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        activities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ActivityCell.self)) as? ActivityCell else {
            return UITableViewCell()
        }
        
        let activity = activities[indexPath.row]
        cell.activity = activity
        
        return cell
    }
    
}
