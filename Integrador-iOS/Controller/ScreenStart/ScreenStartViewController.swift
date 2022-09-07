//
//  ScreenStartViewController.swift
//  Integrador-iOS
//
//  Created by Jacobo Ezequiel Corvalan on 07/09/2022.
//

import UIKit

class ScreenStartViewController: UIViewController {
    
    private lazy var logoImageApp: UIImageView = {
        let aImageView = UIImageView()
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        aImageView.clipsToBounds = true
        let image = UIImage(named: "logo")
        aImageView.image = image
        view.addSubview(aImageView)
        
        return aImageView
    }()
    
    private lazy var participantsLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.text = "Participants"
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        view.addSubview(aLabel)
        
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
        view.addSubview(aTextField)
        
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
        
        view.addSubview(aButton)
        
        return aButton
    }()
    
    private lazy var termsLabel: UILabel = {
        let aLabel = UILabel()
        
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.textAlignment = .center
        aLabel.attributedText = NSAttributedString(string: "Terms and conditions", attributes:
                                                    [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        view.addSubview(aLabel)
        
        return aLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }

    private func setupView(){
        setupConstraints()
        
        view.backgroundColor = UIColor(red: 0.31, green: 0.28, blue: 0.94, alpha: 1.00)
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
            
            buttonStart.bottomAnchor.constraint(equalTo: termsLabel.topAnchor, constant: -16),
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonStart.heightAnchor.constraint(equalToConstant: 50),
            
            termsLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            termsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                                            
        ])
    }
}
