//
//  MarsRoverViewCell.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 19.03.2022.
//

import UIKit

class MarsRoverViewCell: UITableViewCell {
    //MARK: - Properties
    private lazy var customMarsRoverView: UIView = {
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
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.masksToBounds = false
        
        return view
    }()
    
    lazy var bigViewRoverImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var smallViewRoverImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var marsRoverNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Name of Rover"
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
    
    //MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = customMarsRoverView.bounds
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
extension MarsRoverViewCell: ConfigureViewProtocol {
    func configureView() {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(customMarsRoverView)
        customMarsRoverView.layer.addSublayer(gradientLayer)
        
        customMarsRoverView.addSubview(bigView)
        bigView.addSubview(bigViewRoverImage)
        
        bigView.addSubview(smallView)
        smallView.addSubview(smallViewRoverImage)
        
        customMarsRoverView.addSubview(marsRoverNameLabel)
        
        NSLayoutConstraint.activate([
            customMarsRoverView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customMarsRoverView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customMarsRoverView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customMarsRoverView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            bigView.topAnchor.constraint(equalTo: customMarsRoverView.topAnchor, constant: 20),
            bigView.leadingAnchor.constraint(equalTo: customMarsRoverView.leadingAnchor, constant: 20),
            bigView.trailingAnchor.constraint(equalTo: customMarsRoverView.trailingAnchor, constant: -20),
            bigView.heightAnchor.constraint(equalToConstant: 300),
            
            bigViewRoverImage.topAnchor.constraint(equalTo: bigView.topAnchor),
            bigViewRoverImage.leadingAnchor.constraint(equalTo: bigView.leadingAnchor),
            bigViewRoverImage.trailingAnchor.constraint(equalTo: bigView.trailingAnchor),
            bigViewRoverImage.bottomAnchor.constraint(equalTo: bigView.bottomAnchor),
            
            smallView.topAnchor.constraint(equalTo: bigView.topAnchor, constant: 30),
            smallView.leadingAnchor.constraint(equalTo: bigView.leadingAnchor, constant: 30),
            smallView.trailingAnchor.constraint(equalTo: bigView.trailingAnchor, constant: -30),
            smallView.bottomAnchor.constraint(equalTo: bigView.bottomAnchor, constant: -30),
            
            smallViewRoverImage.topAnchor.constraint(equalTo: smallView.topAnchor),
            smallViewRoverImage.leadingAnchor.constraint(equalTo: smallView.leadingAnchor),
            smallViewRoverImage.trailingAnchor.constraint(equalTo: smallView.trailingAnchor),
            smallViewRoverImage.bottomAnchor.constraint(equalTo: smallView.bottomAnchor),
            
            marsRoverNameLabel.topAnchor.constraint(equalTo: bigView.bottomAnchor, constant: 20),
            marsRoverNameLabel.leadingAnchor.constraint(equalTo: customMarsRoverView.leadingAnchor, constant: 20),
            marsRoverNameLabel.trailingAnchor.constraint(equalTo: customMarsRoverView.trailingAnchor, constant: -20),
            marsRoverNameLabel.bottomAnchor.constraint(equalTo: customMarsRoverView.bottomAnchor, constant: -20)
        ])
    }

}
