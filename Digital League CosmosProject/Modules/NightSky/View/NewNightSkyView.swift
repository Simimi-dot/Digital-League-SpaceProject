//
//  SolarSystemNewPlanetView.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 10.04.2022.
//

import UIKit

class NewNightSkyView: UIView {
    //MARK: - Properties
    private lazy var newPlanetScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var allContentView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var forImageView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.masksToBounds = false
        
        return view
    }()
    
    lazy var nightSkyImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.backgroundColor = .lightGray
        image.image = UIImage(named: "NewPlanetPhoto")
        
        return image
    }()
    
    lazy var photoButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newPhotoTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.placeholder = "Добавить описание"
        textField.layer.cornerRadius = 4
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        
        return textField
    }()
    
    lazy var newPlanetButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var backButton: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.setTitle("Вернуться", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.masksToBounds = false
        
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
        customizeBackGround()
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func customizeBackGround() {
        let backGroundImageView = UIImageView(image: UIImage(named: "BackgroundSpace"))
        backGroundImageView.frame = self.frame
        backGroundImageView.contentMode = .scaleAspectFill
        self.addSubview(backGroundImageView)
        self.sendSubviewToBack(backGroundImageView)
    }
    
}

//MARK: - ConfigureViewProtocol
extension NewNightSkyView: ConfigureViewProtocol {
    func configureView() {
        addSubview(newPlanetScrollView)
        
        newPlanetScrollView.addSubview(allContentView)
        allContentView.addSubview(forImageView)
        forImageView.addSubview(nightSkyImageView)
        forImageView.addSubview(photoButton)
        
        allContentView.addSubview(newPhotoTextField)
        allContentView.addSubview(newPlanetButton)
        allContentView.addSubview(backButton)
        
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
            
            forImageView.topAnchor.constraint(equalTo: allContentView.topAnchor, constant: 100),
            forImageView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 50),
            forImageView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -50),
            forImageView.heightAnchor.constraint(equalToConstant: 250),
            
            nightSkyImageView.topAnchor.constraint(equalTo: forImageView.topAnchor),
            nightSkyImageView.leadingAnchor.constraint(equalTo: forImageView.leadingAnchor),
            nightSkyImageView.trailingAnchor.constraint(equalTo: forImageView.trailingAnchor),
            nightSkyImageView.bottomAnchor.constraint(equalTo: forImageView.bottomAnchor),
            
            photoButton.topAnchor.constraint(equalTo: forImageView.topAnchor),
            photoButton.leadingAnchor.constraint(equalTo: forImageView.leadingAnchor),
            photoButton.trailingAnchor.constraint(equalTo: forImageView.trailingAnchor),
            photoButton.bottomAnchor.constraint(equalTo: forImageView.bottomAnchor),
            
            newPhotoTextField.topAnchor.constraint(equalTo: forImageView.bottomAnchor, constant: 20),
            newPhotoTextField.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 60),
            newPhotoTextField.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -60),
            
            newPlanetButton.topAnchor.constraint(equalTo: newPhotoTextField.bottomAnchor, constant: 50),
            newPlanetButton.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            newPlanetButton.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            newPlanetButton.heightAnchor.constraint(equalToConstant: 50),
            
            backButton.topAnchor.constraint(equalTo: newPlanetButton.bottomAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
