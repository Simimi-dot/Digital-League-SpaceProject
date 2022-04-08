//
//  SolarSystemPlanetInfromationControllerView.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 19.03.2022.
//

import UIKit

class SolarSystemPlanetInfromationControllerView: UIView {
    //MARK: - Properties
    private lazy var mainView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var allInformationScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var allContentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var planetImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 1
        image.layer.shadowRadius = 10
        image.layer.shadowOffset = CGSize(width: 0, height: 0)
        image.layer.masksToBounds = false
        
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var planetInformationView: UIView = {
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
    
    private lazy var oneYearPeriodTitleLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Количество дней в году"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var spinPeriodTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Количество часов в одном дне"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var oneYearPeriodLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Длительность одного года"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var spinPeriodLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Один оборот вокруг своей оси"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var interestingInformationView: UIView = {
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
    
    private lazy var interestingInformationTitleLabel: UILabel = {
       var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.text = "Интересный факт"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        title.textAlignment = .center
        return title
    }()
    
    lazy var interestingInformationLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 30
        label.textAlignment = .center
        return label
    }()
    
    private lazy var planetInformationGradientLayer: CAGradientLayer = {
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
    
    private lazy var interestingInformationGradientLayer: CAGradientLayer = {
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
        planetInformationView.layoutIfNeeded()
        interestingInformationView.layoutIfNeeded()
        
        planetInformationGradientLayer.frame = planetInformationView.bounds
        interestingInformationGradientLayer.frame = interestingInformationView.bounds
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
extension SolarSystemPlanetInfromationControllerView: ConfigureViewProtocol {
    func configureView() {
        addSubview(allInformationScrollView)
        
        allInformationScrollView.addSubview(allContentView)
        
        allContentView.addSubview(planetImageView)
        allContentView.addSubview(planetInformationView)
        planetInformationView.layer.addSublayer(planetInformationGradientLayer)
        allContentView.addSubview(interestingInformationView)
        interestingInformationView.layer.addSublayer(interestingInformationGradientLayer)
        
        planetInformationView.addSubview(oneYearPeriodTitleLabel)
        planetInformationView.addSubview(spinPeriodTitleLabel)
        planetInformationView.addSubview(oneYearPeriodLabel)
        planetInformationView.addSubview(spinPeriodLabel)
        
        interestingInformationView.addSubview(interestingInformationLabel)
        interestingInformationView.addSubview(interestingInformationTitleLabel)
        
        NSLayoutConstraint.activate([
            allInformationScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            allInformationScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            allInformationScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            allInformationScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            allContentView.topAnchor.constraint(equalTo: allInformationScrollView.topAnchor),
            allContentView.leadingAnchor.constraint(equalTo: allInformationScrollView.leadingAnchor),
            allContentView.trailingAnchor.constraint(equalTo: allInformationScrollView.trailingAnchor),
            allContentView.bottomAnchor.constraint(equalTo: allInformationScrollView.bottomAnchor),
            allContentView.widthAnchor.constraint(equalTo: allInformationScrollView.widthAnchor),
            allContentView.heightAnchor.constraint(equalToConstant: 1400),
            
            planetImageView.topAnchor.constraint(equalTo: allContentView.topAnchor, constant: 50),
            planetImageView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            planetImageView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            planetImageView.heightAnchor.constraint(equalToConstant: 300),
            
            planetInformationView.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 50),
            planetInformationView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            planetInformationView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            
            oneYearPeriodTitleLabel.topAnchor.constraint(equalTo: planetInformationView.topAnchor, constant: 20),
            oneYearPeriodTitleLabel.leadingAnchor.constraint(equalTo: planetInformationView.leadingAnchor, constant: 20),
            oneYearPeriodTitleLabel.trailingAnchor.constraint(equalTo: planetInformationView.trailingAnchor, constant: -20),
            
            oneYearPeriodLabel.topAnchor.constraint(equalTo: oneYearPeriodTitleLabel.bottomAnchor, constant: 20),
            oneYearPeriodLabel.leadingAnchor.constraint(equalTo: planetInformationView.leadingAnchor, constant: 20),
            oneYearPeriodLabel.trailingAnchor.constraint(equalTo: planetInformationView.trailingAnchor, constant: -20),
            
            spinPeriodTitleLabel.topAnchor.constraint(equalTo: oneYearPeriodLabel.bottomAnchor, constant: 20),
            spinPeriodTitleLabel.leadingAnchor.constraint(equalTo: planetInformationView.leadingAnchor, constant: 20),
            spinPeriodTitleLabel.trailingAnchor.constraint(equalTo: planetInformationView.trailingAnchor, constant: -20),
            
            spinPeriodLabel.topAnchor.constraint(equalTo: spinPeriodTitleLabel.bottomAnchor, constant: 20),
            spinPeriodLabel.leadingAnchor.constraint(equalTo: planetInformationView.leadingAnchor, constant: 20),
            spinPeriodLabel.trailingAnchor.constraint(equalTo: planetInformationView.trailingAnchor, constant: -20),
            spinPeriodLabel.bottomAnchor.constraint(equalTo: planetInformationView.bottomAnchor, constant: -20),
            
            interestingInformationView.topAnchor.constraint(equalTo: planetInformationView.bottomAnchor, constant: 20),
            interestingInformationView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            interestingInformationView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            
            interestingInformationTitleLabel.topAnchor.constraint(equalTo: interestingInformationView.topAnchor, constant: 20),
            interestingInformationTitleLabel.leadingAnchor.constraint(equalTo: interestingInformationView.leadingAnchor, constant: 20),
            interestingInformationTitleLabel.trailingAnchor.constraint(equalTo: interestingInformationView.trailingAnchor, constant: -20),
            
            interestingInformationLabel.topAnchor.constraint(equalTo: interestingInformationTitleLabel.bottomAnchor, constant: 20),
            interestingInformationLabel.leadingAnchor.constraint(equalTo: interestingInformationView.leadingAnchor, constant: 20),
            interestingInformationLabel.trailingAnchor.constraint(equalTo: interestingInformationView.trailingAnchor, constant: -20),
            interestingInformationLabel.bottomAnchor.constraint(equalTo: interestingInformationView.bottomAnchor, constant: -20)
        ])
    }
    
}
