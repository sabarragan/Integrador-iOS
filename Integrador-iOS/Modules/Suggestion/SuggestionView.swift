//
//  SuggestionView.swift
//  Integrador-iOS
//
//  Created by Ana Lucia Blanco Cervantes on 06/09/22.
//

import UIKit

class SuggestionView: UIView {
    // MARK: - Public properties
    var activityType: ActivityType = .random
    
    var categoryName: String? {
        didSet {
            categoryTitleLabel.text = categoryName
        }
    }
    
    var activityText: String? {
        didSet {
            activityTitle.text = activityText ?? "Error"
        }
    }
    
    var participantsCount: Int? {
        didSet {
            participantsCountLabel.text = String(participantsCount ?? 0)
        }
    }
    
    var price: Double? {
        didSet {
            if let price = price {
                switch price {
                case 0:
                    priceCountLabel.text = "Free!"
                case 0.1...0.3:
                    priceCountLabel.text = "Low"
                case 0.4...0.6:
                    priceCountLabel.text = "Medium"
                case 0.7...1.0:
                    priceCountLabel.text = "High"
                default:
                    priceCountLabel.text = "Error"
                }
            }
        }
    }
    
    // MARK: - Properties
    private let activityTitle: UILabel = {
        let label = UILabel()
        label.text = "Learn how to play a new sport"
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 38)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 34
        return stackView
    }()
    
    // MARK: Participants section
    private lazy var participantsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 24
        [participantsIcon,
         participantsTitleLabel,
         participantsCountLabel].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private let participantsIcon: UIImageView = {
        let iconImage = UIImage(systemName: "person.fill")
        let icon = UIImageView(image: iconImage)
        icon.tintColor = .black
        return icon
    }()
    
    private let participantsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Participants"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        return label
    }()
    
    private var participantsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        label.textAlignment = .right
        return label
    }()
    
    // MARK: Price section
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 24
        [priceIcon,
         priceTitleLabel,
         priceCountLabel].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private let priceIcon: UIImageView = {
        let iconImage = UIImage(systemName: "dollarsign.circle.fill")
        let icon = UIImageView(image: iconImage)
        icon.tintColor = .black
        return icon
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        return label
    }()
    
    private var priceCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Medium"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        label.textAlignment = .right
        return label
    }()
    
    // MARK: Category section
    private lazy var categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 24
        [categoryIcon,
         categoryTitleLabel].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private let categoryIcon: UIImageView = {
        let iconImage = UIImage(systemName: "list.bullet")
        let icon = UIImageView(image: iconImage)
        icon.tintColor = .black
        return icon
    }()
    
    private var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Relaxation"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .label
        return label
    }()
    
    private var tryAnotherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Try another", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.backgroundColor = UIColor(red: 0.38, green: 0.60, blue: 0.89, alpha: 1.00)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        setupActivityType()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup & Constraints
    private func setupActivityType() {
        
        switch activityType {
        case .random:
            [participantsStackView,
             priceStackView,
             categoryStackView].forEach { mainStackView.addArrangedSubview($0) }
            
        case .category:
            [participantsStackView,
             priceStackView].forEach { mainStackView.addArrangedSubview($0) }
        }
    }
    
    private func viewSetup() {
        backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.99, alpha: 1.00)
    }
    
    private func addSubviews() {
        [activityTitle,
         mainStackView,
         tryAnotherButton].forEach { addSubview($0) }
    }
    
    private func addConstraints() {
        activityTitle.anchors(top: safeAreaLayoutGuide.topAnchor,
                              leading: safeAreaLayoutGuide.leadingAnchor,
                              trailing: safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: 50,
                                                    left: 55,
                                                    bottom: 0,
                                                    right: 55))
        
        mainStackView.anchors(leading: safeAreaLayoutGuide.leadingAnchor,
                              trailing: safeAreaLayoutGuide.trailingAnchor,
                              centerX: centerXAnchor,
                              centerY: centerYAnchor,
                              padding: UIEdgeInsets(top: 0,
                                                    left: 55,
                                                    bottom: 0,
                                                    right: 55))
        
        participantsIcon.anchors(size: CGSize(width: 36, height: 36))
        priceIcon.anchors(size: CGSize(width: 36, height: 36))
        categoryIcon.anchors(size: CGSize(width: 36, height: 36))
        
        tryAnotherButton.anchors(leading: safeAreaLayoutGuide.leadingAnchor,
                                 bottom: safeAreaLayoutGuide.bottomAnchor,
                                 trailing: safeAreaLayoutGuide.trailingAnchor,
                                 padding: UIEdgeInsets(top: 0,
                                                       left: 42,
                                                       bottom: 30,
                                                       right: 42),
                                 size: CGSize(width: 0, height: 44))
    }
}

// MARK: - Helpers

extension UIView {
    func anchors(top: NSLayoutYAxisAnchor? = nil,
                 leading: NSLayoutXAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil,
                 trailing: NSLayoutXAxisAnchor? = nil,
                 centerX: NSLayoutXAxisAnchor? = nil,
                 centerXConstants: CGFloat = 0.0,
                 centerY: NSLayoutYAxisAnchor? = nil,
                 centerYConstants: CGFloat = 0.0,
                 padding: UIEdgeInsets = .zero,
                 size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstants).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: centerYConstants).isActive = true
        }
    }
}
