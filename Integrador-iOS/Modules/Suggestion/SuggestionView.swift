//
//  SuggestionView.swift
//  Integrador-iOS
//
//  Created by Ana Lucia Blanco Cervantes on 06/09/22.
//

import UIKit

class SuggestionView: UIView {
    // MARK: - Public properties
    var activityType: ActivityType? {
        didSet {
            [participantsStackView,
             priceStackView].forEach { mainStackView.addArrangedSubview($0) }
            
            switch activityType {
            case .random:
                typeTitle.text = "Random"
                mainStackView.addArrangedSubview(categoryStackView)
            case .category:
                break
            case .none:
                print("error")
            }
        }
    }
    
    lazy var categoryName: String = "" {
        didSet {
            categoryTitleLabel.text = categoryName
            if activityType == .category {
                typeTitle.text = categoryName
            }
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
    
    // MARK: Main top bar section
    private lazy var blueView: UIView = {
       let blueView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor(named: "text")
        blueView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return blueView
    }()
    
    private lazy var typeTitle: UILabel = {
        let activityTitle = UILabel()
        activityTitle.translatesAutoresizingMaskIntoConstraints = false
        activityTitle.textColor = .white
        activityTitle.font = .systemFont(ofSize: 30, weight: .bold)
        activityTitle.textAlignment = .center
        activityTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        activityTitle.widthAnchor.constraint(equalToConstant: 180).isActive = true
        return activityTitle
    }()
    
    private lazy var backButton: UIButton = {
       let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"),for: .normal)
        backButton.tintColor = .white
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return backButton
    }()
    
    // MARK: Main section
    private let activityTitle: UILabel = {
        let label = UILabel()
        label.text = "Learn how to play a new sport"
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 38)
        label.textColor = .white
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
        icon.tintColor = .white
        return icon
    }()
    
    private let participantsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Participants"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private var participantsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
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
        icon.tintColor = .white
        return icon
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private var priceCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Medium"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
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
        icon.tintColor = .white
        return icon
    }()
    
    private var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Relaxation"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private var tryAnotherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Try another", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.backgroundColor = UIColor(named: "text")
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    func setTargetForBackButton(target: Any?, action: Selector) {
        backButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setTargetForTryAnotherButton(target: Any?, action: Selector) {
        tryAnotherButton.addTarget(target, action: action, for: .touchDown)
    }
    
    // MARK: - Setup & Constraints
    private func viewSetup() {
        backgroundColor = UIColor(named: "background")
    }
    
    private func addSubviews() {
        [blueView,
         typeTitle,
         backButton,
         activityTitle,
         mainStackView,
         tryAnotherButton].forEach { addSubview($0) }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: topAnchor),
            blueView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            typeTitle.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 60),
            typeTitle.centerXAnchor.constraint(equalTo: blueView.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 20),
        ])
        
        activityTitle.anchors(top: blueView.bottomAnchor,
                              leading: safeAreaLayoutGuide.leadingAnchor,
                              trailing: safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: 50,
                                                    left: 45,
                                                    bottom: 0,
                                                    right: 45))
        
        mainStackView.anchors(leading: safeAreaLayoutGuide.leadingAnchor,
                              trailing: safeAreaLayoutGuide.trailingAnchor,
                              centerX: centerXAnchor,
                              centerY: centerYAnchor,
                              padding: UIEdgeInsets(top: 0,
                                                    left: 45,
                                                    bottom: 0,
                                                    right: 45))
        
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
