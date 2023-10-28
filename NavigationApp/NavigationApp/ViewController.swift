//
//  ViewController.swift
//  NavigationApp
//
//  Created by nika razmadze on 27.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let forgotPasswordLabel = UILabel()
    let signInButton = UIButton()
    let lineView = UIView()
    let orLabel = UILabel()
    let googleButton = UIButton()
    let facebookButton = UIButton()
    let linkedInButton = UIButton()
    let signUpLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemBackground
        cratingElements()
        addingConstrains()
    }
    
    // MARK: - Elements
    func cratingElements() {
        
        profileImageView.image = UIImage(named: "elon_image")
        profileImageView.layer.cornerRadius = (profileImageView.frame.size.width / 2)
        profileImageView.clipsToBounds = true
        
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.cornerRadius = 16
        emailTextField.clipsToBounds = true
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.clipsToBounds = true
        
        forgotPasswordLabel.text = "Forgot your password?"
        forgotPasswordLabel.isEnabled = false
        forgotPasswordLabel.font = UIFont.systemFont(ofSize: 14)
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .systemBlue
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        lineView.backgroundColor = .lightGray
        
        orLabel.text = "or"
        
        googleButton.setImage(UIImage(named: "google_logo"), for: .normal)
        googleButton.contentMode = .scaleAspectFit
        
        facebookButton.setImage(UIImage(named: "facebook_logo"), for: .normal)
        facebookButton.contentMode = .scaleAspectFit
        
        linkedInButton.setImage(UIImage(named: "linkedin_logo"), for: .normal)
        linkedInButton.contentMode = .scaleAspectFit
        
        signUpLabel.text = "Don't have an account? Sign up"
        
        view.addSubview(profileImageView)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(signInButton)
        view.addSubview(lineView)
        view.addSubview(orLabel)
        view.addSubview(signUpLabel)
    }
    
    // MARK: - Constrains
    func addingConstrains() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true

        let textFieldsStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 15
        textFieldsStackView.distribution = .fillEqually
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldsStackView)

        textFieldsStackView.widthAnchor.constraint(equalToConstant: 289).isActive = true
        textFieldsStackView.heightAnchor.constraint(equalToConstant: 153).isActive = true
        textFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldsStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true

        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.trailingAnchor.constraint(equalTo: textFieldsStackView.trailingAnchor).isActive = true
        forgotPasswordLabel.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 10).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.widthAnchor.constraint(equalToConstant: 292).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signInButton.layer.cornerRadius = 30
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 30).isActive = true

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor.constraint(equalToConstant: 272).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 35).isActive = true
        lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true

        let buttonSize = CGSize(width: 42, height: 42)

        googleButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true

        facebookButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true

        linkedInButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        linkedInButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true

        let socialButtonsStackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, linkedInButton])
        socialButtonsStackView.spacing = 15
        socialButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(socialButtonsStackView)

        socialButtonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        socialButtonsStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 30).isActive = true
        
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true


    }
    
    //MARK: - Navigation
    @objc func signInButtonTapped() {
        
        if let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty {
            
            let homePageVC = HomePageVC()
            navigationController?.pushViewController(homePageVC, animated: true)
            
        } else {
            emailTextField.backgroundColor = .red
            passwordTextField.backgroundColor = .red
        }
    }
}



    


