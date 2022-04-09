//
//  SolarSystemNewPlanetView.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 10.04.2022.
//

import UIKit

class SolarSystemNewPlanetView: UIView {
    //MARK: - Properties
    lazy var newPlanetScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var allContentView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var planetPhotoButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.black.cgColor
        button.setImage(UIImage(named: "NewPlanetPhoto"), for: .normal)
        button.contentMode = .scaleToFill
        button.backgroundColor = .white
        return button
    }()
    
    lazy var newPlanetNameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.placeholder = "Введите название планеты"
        textField.layer.cornerRadius = 4
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var newPlanetButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.setTitle("Добавить плнету", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        var gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 97/255.0, green: 184/255.0, blue: 255/255.0, alpha: 1).cgColor,
            UIColor(red: 50/255.0, green: 32/255.0, blue: 72/255.0, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = 12
        return gradient
    }()
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ConfigureViewProtocol
extension SolarSystemNewPlanetView: ConfigureViewProtocol {
    func configureView() {
//        backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundSpace")!)
        
        layer.addSublayer(gradientLayer)
        addSubview(newPlanetScrollView)
        
        newPlanetScrollView.addSubview(allContentView)
        
        allContentView.addSubview(planetPhotoButton)
        allContentView.addSubview(newPlanetNameTextField)
        allContentView.addSubview(newPlanetButton)
        
        NSLayoutConstraint.activate([
            newPlanetScrollView.topAnchor.constraint(equalTo: topAnchor),
            newPlanetScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newPlanetScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newPlanetScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            allContentView.topAnchor.constraint(equalTo: newPlanetScrollView.topAnchor),
            allContentView.leadingAnchor.constraint(equalTo: newPlanetScrollView.leadingAnchor),
            allContentView.trailingAnchor.constraint(equalTo: newPlanetScrollView.trailingAnchor),
            allContentView.bottomAnchor.constraint(equalTo: newPlanetScrollView.bottomAnchor),
            allContentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            allContentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            planetPhotoButton.topAnchor.constraint(equalTo: allContentView.topAnchor, constant: 50),
            planetPhotoButton.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 50),
            planetPhotoButton.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -50),
            planetPhotoButton.heightAnchor.constraint(equalToConstant: 250),
            
            newPlanetNameTextField.topAnchor.constraint(equalTo: planetPhotoButton.bottomAnchor, constant: 20),
            newPlanetNameTextField.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 60),
            newPlanetNameTextField.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -60),
            
            newPlanetButton.topAnchor.constraint(equalTo: newPlanetNameTextField.bottomAnchor, constant: 100),
            newPlanetButton.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            newPlanetButton.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            newPlanetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
