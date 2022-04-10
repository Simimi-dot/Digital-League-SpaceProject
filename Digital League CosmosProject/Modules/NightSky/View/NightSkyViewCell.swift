//
//  NightSkyViewCell.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 10.04.2022.
//

import UIKit

class NightSkyViewCell: UITableViewCell {
    //MARK: - Properties
    private lazy var customNightSkyView: UIView = {
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
    
    lazy var nightSkyImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.backgroundColor = .systemPink
        
        return image
    }()
    
    lazy var nightSkyLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Night Sky Label"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        
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
    
    //MARK: - life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        customNightSkyView.layoutIfNeeded()
        gradientLayer.frame = customNightSkyView.bounds
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
extension NightSkyViewCell: ConfigureViewProtocol {
    func configureView() {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(customNightSkyView)
        customNightSkyView.layer.addSublayer(gradientLayer)
        
        customNightSkyView.addSubview(forImageView)
        forImageView.addSubview(nightSkyImage)
        
        customNightSkyView.addSubview(nightSkyLabel)
        
        NSLayoutConstraint.activate([
            customNightSkyView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customNightSkyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customNightSkyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customNightSkyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            forImageView.topAnchor.constraint(equalTo: customNightSkyView.topAnchor, constant: 20),
            forImageView.leadingAnchor.constraint(equalTo: customNightSkyView.leadingAnchor, constant: 20),
            forImageView.trailingAnchor.constraint(equalTo: customNightSkyView.trailingAnchor, constant: -20),
            forImageView.heightAnchor.constraint(equalToConstant: 300),
            
            nightSkyImage.topAnchor.constraint(equalTo: forImageView.topAnchor),
            nightSkyImage.leadingAnchor.constraint(equalTo: forImageView.leadingAnchor),
            nightSkyImage.trailingAnchor.constraint(equalTo: forImageView.trailingAnchor),
            nightSkyImage.bottomAnchor.constraint(equalTo: forImageView.bottomAnchor),
            
            nightSkyLabel.topAnchor.constraint(equalTo: forImageView.bottomAnchor, constant: 20),
            nightSkyLabel.leadingAnchor.constraint(equalTo: customNightSkyView.leadingAnchor, constant: 20),
            nightSkyLabel.trailingAnchor.constraint(equalTo: customNightSkyView.trailingAnchor, constant: -20),
            nightSkyLabel.bottomAnchor.constraint(equalTo: customNightSkyView.bottomAnchor, constant: -20)
        ])
    }
    
}
