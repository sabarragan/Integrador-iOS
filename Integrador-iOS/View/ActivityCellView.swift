//
//  ActivityCellView.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 7/09/22.
//

import UIKit

class ActivityCell: UITableViewCell {
    let constantCell: CGFloat = 20
    
    var activity: String?{
        didSet {
            activityName.text = activity
        }
    }
    
    private lazy var activityName: UILabel = {
        let activityLabel = UILabel()
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
        activityLabel.textColor = .black
        activityLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return activityLabel
    }()
    
    private lazy var button: UIImageView = {
        let nextButton = UIImageView()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.contentMode = .scaleAspectFit
        nextButton.image = UIImage(named: "Arrow")
        return nextButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(activityName)
        contentView.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constantCell),
            activityName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constantCell),
            activityName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constantCell),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
}
