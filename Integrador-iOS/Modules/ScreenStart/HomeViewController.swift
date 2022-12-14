//
//  ScreenStartViewController.swift
//  Integrador-iOS
//
//  Created by Jacobo Ezequiel Corvalan on 07/09/2022.
//

import UIKit

class HomeViewController: UIViewController, ActivityManagerDelegate {
    
    var taskManager = TaskManager()
    var details: ActivityData?
    let suggestion = SuggestionViewController()
    
    func didUpdateWeather(tasked: ActivityData) {
        DispatchQueue.main.async {
            self.suggestion.activityType = .random
            self.suggestion.actvityText = tasked.activity
            self.suggestion.participantsCount = tasked.participants
            self.suggestion.price = tasked.price
            self.suggestion.categoryName = tasked.type
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    private lazy var logoImageApp: UIImageView = {
        
        let aImageView = UIImageView()
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        aImageView.clipsToBounds = true
        let image = UIImage(named: "logo")
        aImageView.image = image
        
        
        return aImageView
    }()
    
    private lazy var participantsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Participants"
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        return aLabel
    }()
    
    private lazy var participantsTextField: UITextField = {
       
        let aTextField = UITextField()
        aTextField.translatesAutoresizingMaskIntoConstraints = false
        aTextField.backgroundColor = .white
        aTextField.layer.cornerRadius = 12.0
        
        aTextField.layer.shadowOpacity = 1
        aTextField.layer.shadowRadius = 9.0
        aTextField.layer.shadowOffset = CGSize.zero
        aTextField.layer.shadowColor = UIColor(red: 0.15, green: 0.04, blue: 0.70, alpha: 1.00).cgColor
        
        
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: aTextField.frame.height))
        aTextField.leftView = paddingView
        aTextField.leftViewMode = UITextField.ViewMode.always
        
        
        return aTextField
        
    }()
    
    private lazy var buttonStart: UIButton = {
        let aButton = UIButton()
        
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setTitle("Start", for: .normal)
        aButton.backgroundColor = UIColor(red: 0.15, green: 0.04, blue: 0.70, alpha: 1.00)
        aButton.layer.cornerRadius = 12
        
        aButton.layer.shadowOpacity = 1
        aButton.layer.shadowRadius = 2.0
        aButton.layer.shadowOffset = CGSize.zero
        aButton.layer.shadowColor = UIColor.gray.cgColor
        
        aButton.addTarget(self, action: #selector(startButton), for: .touchUpInside)
        
        
        return aButton
    }()
    
    private lazy var termsButton: UIButton = {
        let termsButton = UIButton()
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        termsButton.setTitle("Terms and Conditions", for: .normal)
        termsButton.underline()
        termsButton.addTarget(self, action: #selector(termsConditions), for: .touchUpInside)
        
        
        return termsButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        setupView()
        setupConstraints()
        taskManager.delegate = self
        
        suggestion.setTargetForTryAnotherButton(target: self, action: #selector(didTapTryAnotherButton(_:)))
    }
    
    private func setupView(){
        view.addSubview(logoImageApp)
        view.addSubview(participantsLabel)
        view.addSubview(participantsTextField)
        view.addSubview(buttonStart)
        view.addSubview(termsButton)
        
        
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            logoImageApp.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            logoImageApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageApp.heightAnchor.constraint(equalToConstant: 190),
            logoImageApp.widthAnchor.constraint(equalToConstant: 190),
            
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            participantsLabel.topAnchor.constraint(equalTo: logoImageApp.bottomAnchor, constant: 30),
            
            participantsTextField.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 5),
            participantsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            participantsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            participantsTextField.heightAnchor.constraint(equalToConstant: 48),
            
            buttonStart.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -16),
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonStart.heightAnchor.constraint(equalToConstant: 50),
            
            termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            termsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                                            
        ])
    }
    
    @objc func startButton(){
        if(participantsTextField.hasText) {
            guard let participantsText = participantsTextField.text else { return }
            taskManager.performRequestForParticipants(participantsText)
            navigationController?.pushViewController(suggestion, animated: true)
        } else {
            let vc = ActivityViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func termsConditions(){
        present(TermsViewController(), animated: true)
    }
    
    @objc func didTapTryAnotherButton(_ sender: UIButton) {
        taskManager.performRequestForParticipants(participantsTextField.text!)
    }
    
}

extension UIButton {
    func underline() {
        guard let title = self.titleLabel else { return }
        guard let tittleText = title.text else { return }
        let attributedString = NSMutableAttributedString(string: (tittleText))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: (tittleText.count)))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
    

    
    



