//
//  ActivityViewController.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 7/09/22.
//

import Foundation

import UIKit
import SwiftUI

class ActivityViewController: UIViewController {
    
    var activities: [String] = Activities().activities
    
    private var tableView: UITableView = {
        let activitiesTable = UITableView()
        activitiesTable.translatesAutoresizingMaskIntoConstraints = false
        return activitiesTable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        
        let lbNavTitle = UILabel (frame: CGRect(x: 0, y: 0, width: 320, height: 80 ))
        lbNavTitle.textColor = UIColor.black
        lbNavTitle.numberOfLines = 0
        lbNavTitle.center = CGPoint(x: 0, y: 0)
        lbNavTitle.textAlignment = .center
        lbNavTitle.text = "Activities"
        self.navigationItem.titleView = lbNavTitle
        
        
        view.addSubview(tableView)
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.backgroundColor = .systemBlue
//        navigationController?.navigationBar.contentMode = .scaleToFill
            
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: String(describing: ActivityCell.self))
        
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
    }
    
    
    
}

extension ActivityViewController: UITableViewDelegate {
    
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
