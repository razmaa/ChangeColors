//
//  HomePageVC.swift
//  NavigationApp
//
//  Created by nika razmadze on 28.10.23.
//

import UIKit

class HomePageVC: UIViewController, ColorPaletteDelegate {
    
    let presentButton = UIButton()
    let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        presentButton.setTitle("Present", for: .normal)
        presentButton.backgroundColor = .systemIndigo
        presentButton.layer.cornerRadius = 8
        presentButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)

        
        pushButton.setTitle("Push", for: .normal)
        pushButton.backgroundColor = .systemCyan
        pushButton.layer.cornerRadius = 8
        pushButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)

        
        let stackView = UIStackView(arrangedSubviews: [presentButton, pushButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        
    }
    
    //MARK: - Methods
    func didSelectButtonColor(_ color: UIColor) {
        presentButton.backgroundColor = color
        pushButton.backgroundColor = color
    }
    
    func didSelectBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    

    
    // MARK: - Navigation
    
    @objc func presentButtonTapped() {
        let colorPaletteVC = ColorPaletteViewController()
        colorPaletteVC.delegate = self
        self.present(colorPaletteVC, animated: true, completion: nil)
    }
    
    @objc func pushButtonTapped() {
        let colorPaletteVC = ColorPaletteViewController()
        colorPaletteVC.delegate = self
        navigationController?.pushViewController(colorPaletteVC, animated: true)
    }
    

}
