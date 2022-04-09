//
//  SolarSystemViewCell.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 18.03.2022.
//


import UIKit

class SolarSystemViewCell: UITableViewCell {
    //MARK: - Properties
    private lazy var customSolarSystemView: UIView = {
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
    
    lazy var nameOfPlanetLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название планеты"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var numberOfPlanetLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Номер планеты"
        label.textColor = .white
        return label
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
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
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        customSolarSystemView.layoutIfNeeded()
        gradientLayer.frame = customSolarSystemView.bounds
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ConfigureViewProtocol
extension SolarSystemViewCell: ConfigureViewProtocol {
    func configureView() {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(customSolarSystemView)
        
        customSolarSystemView.layer.addSublayer(gradientLayer)
        customSolarSystemView.addSubview(planetImageView)
        customSolarSystemView.addSubview(nameOfPlanetLabel)
        customSolarSystemView.addSubview(numberOfPlanetLabel)
        
        let nameOfPlanetLeadingConstraint = nameOfPlanetLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 20)
        nameOfPlanetLeadingConstraint.priority = .defaultLow
        
        let numberOfPlanetLeadingConstraint = numberOfPlanetLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 20)
        numberOfPlanetLeadingConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            customSolarSystemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customSolarSystemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customSolarSystemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customSolarSystemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            planetImageView.topAnchor.constraint(equalTo: customSolarSystemView.topAnchor, constant: 20),
            planetImageView.leadingAnchor.constraint(equalTo: customSolarSystemView.leadingAnchor, constant: 20),
            planetImageView.bottomAnchor.constraint(equalTo: customSolarSystemView.bottomAnchor, constant: -20),
            planetImageView.widthAnchor.constraint(equalToConstant: 160),
            
            nameOfPlanetLabel.topAnchor.constraint(equalTo: planetImageView.topAnchor),
            nameOfPlanetLeadingConstraint,
            nameOfPlanetLabel.trailingAnchor.constraint(equalTo: customSolarSystemView.trailingAnchor, constant: -20),
            
            numberOfPlanetLeadingConstraint,
            numberOfPlanetLabel.trailingAnchor.constraint(equalTo: customSolarSystemView.trailingAnchor, constant: -20),
            numberOfPlanetLabel.bottomAnchor.constraint(equalTo: planetImageView.bottomAnchor)
            
        ])
    }
}
