//
//  GalaxyViewCell.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 23.03.2022.
//

import UIKit

class GalaxyViewCell: UITableViewCell {
    //MARK: - Properties
    private lazy var customGalaxyView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.masksToBounds = false
        
        return view
    }()
    
    private lazy var galaxyScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var allGalaxyContentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var bigView: UIView = {
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
    
    private lazy var smallView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.masksToBounds = false
        
        return view
    }()
    
    lazy var bigViewGalaxyImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var smallViewGalaxyImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var informationView: UIView = {
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
    
    private lazy var informationTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Интересный факт"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 30
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
//    lazy var toPlanetsButton: UIButton = {
//       let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemBlue
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("КНОПКА", for: .normal)
//        return button
//    }()
    
    // Gradient Layer
    private lazy var customGalaxyViewGradientLayer: CAGradientLayer = {
        var gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 97/255.0, green: 184/255.0, blue: 255/255.0, alpha: 0.6).cgColor,
            UIColor(red: 50/255.0, green: 32/255.0, blue: 72/255.0, alpha: 0.6).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = 12
        return gradient
    }()
    
    
    private lazy var informationViewGradentLayer: CAGradientLayer = {
        var gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 63/255.0, green: 33/255.0, blue: 9/255.0, alpha: 0.7).cgColor,
            UIColor(red: 216/255.0, green: 188/255.0, blue: 148/255.0, alpha: 0.7).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = 12
        return gradient
    }()
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        informationView.layoutIfNeeded()
        customGalaxyView.layoutIfNeeded()
        
        informationViewGradentLayer.frame = informationView.bounds
        customGalaxyViewGradientLayer.frame = customGalaxyView.bounds
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

//MARK: - ConfigureViewProtocol
extension GalaxyViewCell: ConfigureViewProtocol {
    func configureView() {
        contentView.addSubview(customGalaxyView)
        customGalaxyView.layer.addSublayer(customGalaxyViewGradientLayer)
        customGalaxyView.addSubview(galaxyScrollView)
        
        galaxyScrollView.addSubview(allGalaxyContentView)
        
        allGalaxyContentView.addSubview(bigView)
        bigView.addSubview(bigViewGalaxyImage)
        bigView.addSubview(smallView)
        smallView.addSubview(smallViewGalaxyImage)
        
        allGalaxyContentView.addSubview(informationView)
        informationView.layer.addSublayer(informationViewGradentLayer)
        informationView.addSubview(informationTitleLabel)
        informationView.addSubview(informationLabel)
        
//        customGalaxyView.addSubview(toPlanetsButton)
        
        NSLayoutConstraint.activate([
            customGalaxyView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customGalaxyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customGalaxyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customGalaxyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            galaxyScrollView.topAnchor.constraint(equalTo: customGalaxyView.topAnchor),
            galaxyScrollView.leadingAnchor.constraint(equalTo: customGalaxyView.leadingAnchor),
            galaxyScrollView.trailingAnchor.constraint(equalTo: customGalaxyView.trailingAnchor),
            galaxyScrollView.bottomAnchor.constraint(equalTo: customGalaxyView.bottomAnchor),
            
            allGalaxyContentView.topAnchor.constraint(equalTo: galaxyScrollView.topAnchor),
            allGalaxyContentView.leadingAnchor.constraint(equalTo: galaxyScrollView.leadingAnchor),
            allGalaxyContentView.trailingAnchor.constraint(equalTo: galaxyScrollView.trailingAnchor),
            allGalaxyContentView.bottomAnchor.constraint(equalTo: galaxyScrollView.bottomAnchor),
            allGalaxyContentView.widthAnchor.constraint(equalTo: galaxyScrollView.widthAnchor),
            allGalaxyContentView.heightAnchor.constraint(equalToConstant: 1000),
            
            bigView.topAnchor.constraint(equalTo: allGalaxyContentView.topAnchor, constant: 20),
            bigView.leadingAnchor.constraint(equalTo: allGalaxyContentView.leadingAnchor, constant: 20),
            bigView.trailingAnchor.constraint(equalTo: allGalaxyContentView.trailingAnchor, constant: -20),
            bigView.heightAnchor.constraint(equalToConstant: 300),
            
            bigViewGalaxyImage.topAnchor.constraint(equalTo: bigView.topAnchor),
            bigViewGalaxyImage.leadingAnchor.constraint(equalTo: bigView.leadingAnchor),
            bigViewGalaxyImage.trailingAnchor.constraint(equalTo: bigView.trailingAnchor),
            bigViewGalaxyImage.bottomAnchor.constraint(equalTo: bigView.bottomAnchor),
            
            smallView.topAnchor.constraint(equalTo: bigView.topAnchor, constant: 40),
            smallView.leadingAnchor.constraint(equalTo: bigView.leadingAnchor, constant: 40),
            smallView.trailingAnchor.constraint(equalTo: bigView.trailingAnchor, constant: -40),
            smallView.bottomAnchor.constraint(equalTo: bigView.bottomAnchor, constant: -40),
            
            smallViewGalaxyImage.topAnchor.constraint(equalTo: smallView.topAnchor),
            smallViewGalaxyImage.leadingAnchor.constraint(equalTo: smallView.leadingAnchor),
            smallViewGalaxyImage.trailingAnchor.constraint(equalTo: smallView.trailingAnchor),
            smallViewGalaxyImage.bottomAnchor.constraint(equalTo: smallView.bottomAnchor),
            
            informationView.topAnchor.constraint(equalTo: bigView.bottomAnchor, constant: 20),
            informationView.leadingAnchor.constraint(equalTo: allGalaxyContentView.leadingAnchor, constant: 20),
            informationView.trailingAnchor.constraint(equalTo: allGalaxyContentView.trailingAnchor, constant: -20),
            
            informationTitleLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 20),
            informationTitleLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            informationTitleLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            
            informationLabel.topAnchor.constraint(equalTo: informationTitleLabel.bottomAnchor, constant: 20),
            informationLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            informationLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            informationLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -20),
            
//            toPlanetsButton.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 20),
//            toPlanetsButton.leadingAnchor.constraint(equalTo: allGalaxyContentView.leadingAnchor, constant: 20),
//            toPlanetsButton.trailingAnchor.constraint(equalTo: allGalaxyContentView.trailingAnchor, constant: -20),
//            toPlanetsButton.bottomAnchor.constraint(equalTo: allGalaxyContentView.bottomAnchor, constant: -20)
        ])
    }
    
}



