//
//  MarsRoverPhotoInformationControllerView.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 27.03.2022.
//

import UIKit

class MarsRoverPhotoInformationControllerView: UIView {
    //MARK: - Properties
    private let planetInformationScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let allContentView: UIView = {
        let view = UIView()
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
    
    lazy var photoImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.backgroundColor = .systemPink
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
    
    private lazy var earthDateTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Дата на земле"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var eartDateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "тут будет дата на земле"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var cameraTitleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название камеры"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var abbreviationСameraLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "аббревиатура камеры"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var fullNameСameraLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "полное название камеры"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 2
        return label
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
        informationViewGradentLayer.frame = informationView.bounds
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
extension MarsRoverPhotoInformationControllerView: ConfigureViewProtocol {
    func configureView() {
        addSubview(planetInformationScrollView)
        planetInformationScrollView.addSubview(allContentView)
        
        allContentView.addSubview(forImageView)
        allContentView.addSubview(informationView)
        informationView.layer.addSublayer(informationViewGradentLayer)
        
        forImageView.addSubview(photoImage)
        
        informationView.addSubview(earthDateTitleLabel)
        informationView.addSubview(eartDateLabel)
        informationView.addSubview(cameraTitleLabel)
        informationView.addSubview(abbreviationСameraLabel)
        informationView.addSubview(fullNameСameraLabel)
        
        NSLayoutConstraint.activate([
            planetInformationScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            planetInformationScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            planetInformationScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            planetInformationScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            allContentView.topAnchor.constraint(equalTo: planetInformationScrollView.topAnchor),
            allContentView.leadingAnchor.constraint(equalTo: planetInformationScrollView.leadingAnchor),
            allContentView.trailingAnchor.constraint(equalTo: planetInformationScrollView.trailingAnchor),
            allContentView.bottomAnchor.constraint(equalTo: planetInformationScrollView.bottomAnchor),
            allContentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            allContentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//            allContentView.widthAnchor.constraint(equalTo: planetInformationScrollView.widthAnchor),
//            allContentView.heightAnchor.constraint(equalToConstant: 700),
            
            forImageView.topAnchor.constraint(equalTo: allContentView.topAnchor, constant: 20),
            forImageView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            forImageView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            forImageView.heightAnchor.constraint(equalToConstant: 300),
            
            photoImage.topAnchor.constraint(equalTo: forImageView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: forImageView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: forImageView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: forImageView.bottomAnchor),
            
            informationView.topAnchor.constraint(equalTo: forImageView.bottomAnchor, constant: 20),
            informationView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            informationView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            
            earthDateTitleLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 20),
            earthDateTitleLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            earthDateTitleLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            
            eartDateLabel.topAnchor.constraint(equalTo: earthDateTitleLabel.bottomAnchor, constant: 20),
            eartDateLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            eartDateLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            
            cameraTitleLabel.topAnchor.constraint(equalTo: eartDateLabel.bottomAnchor, constant: 20),
            cameraTitleLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            cameraTitleLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            
            abbreviationСameraLabel.topAnchor.constraint(equalTo: cameraTitleLabel.bottomAnchor, constant: 20),
            abbreviationСameraLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            abbreviationСameraLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            
            fullNameСameraLabel.topAnchor.constraint(equalTo: abbreviationСameraLabel.bottomAnchor, constant: 20),
            fullNameСameraLabel.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant: 20),
            fullNameСameraLabel.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant: -20),
            fullNameСameraLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -20)
        ])
        
    }
    
}
