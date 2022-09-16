//
//  TermsViewController.swift
//  Integrador-iOS
//
//  Created by Cristian Emmanuel Rivero on 06/09/2022.
//

import UIKit

class TermsViewController: UIViewController {
    
    private let padding: CGFloat = 20
    
    private lazy var dismissButton: UIButton = {
        let aButton = UIButton(type: .system)
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
        aButton.addTarget(self, action: #selector(funcDismiss), for: .touchDown)
        aButton.tintColor = .white
        aButton.contentMode = .scaleAspectFill
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textAlignment = .center
        aLabel.font = UIFont(name: "Arial", size: 40)
        aLabel.textColor = .white
        aLabel.text = "Not Bored"
        view.addSubview(aLabel)
        return aLabel
    }()

    private lazy var termsTextView: UITextView = {
        let aTextView = UITextView()
        aTextView.translatesAutoresizingMaskIntoConstraints = false
        aTextView.text = """
    Lorem ipsum dolor sit amet consectetur adipiscing elit inceptos ridiculus iaculis, nullam ligula elementum duis tellus maecenas nec fermentum sed dictum laoreet, taciti donec habitant quam purus ultricies porta posuere sociis. Cubilia senectus netus integer tempor dignissim viverra nostra tellus scelerisque aliquet, semper penatibus tempus sociosqu class sociis bibendum justo etiam, rutrum aenean et eget pretium volutpat eu dictum dictumst.
    Praesent gravida ridiculus cursus luctus maecenas in libero mi interdum, auctor ullamcorper eget nam eros condimentum litora tristique erat, fusce rhoncus mauris cras aptent non et ultricies. Iaculis porttitor etiam pulvinar proin fringilla ad, sem ornare sociosqu ultrices litora himenaeos egestas, eros laoreet mauris leo porta. Nibh interdum facilisis dapibus magnis phasellus tortor fusce nostra quam, ante non elementum himenaeos id hac et hendrerit eros, dui at sollicitudin turpis viverra molestie cras quis.
    Dignissim faucibus auctor in vitae porttitor tellus nascetur tempor sociosqu, elementum dis ultricies eu tempus tincidunt lectus posuere, et ac interdum commodo montes convallis curae facilisis. Vitae diam phasellus litora ad aenean himenaeos, magnis malesuada nec metus faucibus, turpis mollis hac lacinia lacus. Condimentum dis in sed vel molestie integer, gravida eget volutpat interdum bibendum scelerisque magnis, penatibus non sollicitudin convallis egestas. Aptent mi ligula conubia justo habitant cubilia tellus curabitur, a nisi integer non eget vivamus cursus hac, lacus rutrum ridiculus tempor litora nostra dis.
    Nisl pulvinar taciti tellus diam quam dictum cursus potenti euismod natoque feugiat mattis ornare tortor, aliquam orci dapibus inceptos id egestas ante viverra donec aptent suscipit nulla. Eget nisl fringilla cras felis maecenas nisi ridiculus id conubia hac primis sem ullamcorper porttitor, rutrum ac sodales ultrices vestibulum cum leo semper fusce porta eu fermentum. Proin nisi suspendisse class facilisi curabitur quisque, fusce vulputate semper a nulla velit, duis in orci faucibus turpis. Risus metus magnis aliquam accumsan laoreet congue per, tempus purus et odio senectus sodales vulputate, ligula malesuada dis habitasse nullam pellentesque.
    """
        aTextView.backgroundColor = UIColor(named: "background")
        view.addSubview(aTextView)
        aTextView.textAlignment = .left
        aTextView.font = UIFont(name: "Arial", size: 18)
        aTextView.textColor = .white
        aTextView.isEditable = false
        return aTextView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupConstraints()
        view.backgroundColor = UIColor(named: "background")
        title = "Terms and Conditions"
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dismissButton.widthAnchor.constraint(equalToConstant: 40),
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            termsTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            termsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            termsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            termsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    @objc func funcDismiss() {
        self.dismiss(animated: true)
    }
}



