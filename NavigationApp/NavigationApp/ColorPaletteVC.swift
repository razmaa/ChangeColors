//
//  ColorPaletteVC.swift
//  NavigationApp
//
//  Created by nika razmadze on 28.10.23.
//

import UIKit

protocol ColorPaletteDelegate: AnyObject {
    func didSelectButtonColor(_ color: UIColor)
    func didSelectBackgroundColor(_ color: UIColor)
}

class ColorPaletteViewController: UIViewController {
    
    //MARK: - Elements
    let changeHomeButtonsLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Buttons Background Colors"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let colorButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let changeHomeBackgroundLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Background Color"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let homeBackgroundButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //MARK: - Constrains
        view.addSubview(changeHomeButtonsLabel)
        changeHomeButtonsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeHomeButtonsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        view.addSubview(colorButtonsStack)
        colorButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorButtonsStack.topAnchor.constraint(equalTo: changeHomeButtonsLabel.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(changeHomeBackgroundLabel)
        changeHomeBackgroundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeHomeBackgroundLabel.topAnchor.constraint(equalTo: colorButtonsStack.bottomAnchor, constant: 40).isActive = true
        
        view.addSubview(homeBackgroundButtonsStack)
        homeBackgroundButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeBackgroundButtonsStack.topAnchor.constraint(equalTo: changeHomeBackgroundLabel.bottomAnchor, constant: 20).isActive = true
        
        createColorButtons()
        
        for button in colorButtonsStack.arrangedSubviews {
            if let colorButton = button as? UIButton {
                colorButton.addTarget(self, action: #selector(changeHomeButtonsColor(_:)), for: .touchUpInside)
            }
        }
        
        for button in homeBackgroundButtonsStack.arrangedSubviews {
            if let bgColorButton = button as? UIButton {
                bgColorButton.addTarget(self, action: #selector(changeHomeBackgroundColor(_:)), for: .touchUpInside)
            }
        }
    }
    
    weak var delegate: ColorPaletteDelegate?

    
    func createColorButtons() {
        let colors: [UIColor] = [.red, .green, .blue, .yellow, .orange, .purple]
        
        for color in colors {
            let button = UIButton()
            button.backgroundColor = color
            colorButtonsStack.addArrangedSubview(button)
            
            let bgColorButton = UIButton()
            bgColorButton.backgroundColor = color
            homeBackgroundButtonsStack.addArrangedSubview(bgColorButton)
        }
    }
    
    //MARK: - Navigation
    @objc func changeHomeButtonsColor(_ sender: UIButton) {
        if let color = sender.backgroundColor {
            delegate?.didSelectButtonColor(color)
        }
    }
    
    @objc func changeHomeBackgroundColor(_ sender: UIButton) {
        if let bgColor = sender.backgroundColor {
            delegate?.didSelectBackgroundColor(bgColor)
        }
    }
}
