//
//  APODControllerView.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 28.03.2022.
//

import UIKit

class APODControllerView: UIView {
    //MARK: - Properties
    private lazy var pictureOfTheDayScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var allContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pictureOfTheDayView: UIView = {
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
    
    lazy var toBigPictureButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var dateLabelView: UIView = {
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
        
        view.isHidden = true
        return view
    }()
    
    lazy var pictureOfTheDayImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var activtyIndicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .white
        indicator.startAnimating()
        return indicator
    }()
    
    private lazy var labelViewGradientLayer: CAGradientLayer = {
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
        dateLabelView.layoutIfNeeded()
        labelViewGradientLayer.frame = dateLabelView.bounds
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
extension APODControllerView: ConfigureViewProtocol {
    func configureView() {
        addSubview(pictureOfTheDayScrollView)
        pictureOfTheDayScrollView.addSubview(allContentView)
        
        allContentView.addSubview(pictureOfTheDayView)
        allContentView.addSubview(dateLabelView)
        
        dateLabelView.layer.addSublayer(labelViewGradientLayer)
        dateLabelView.addSubview(dateLabel)
        
        pictureOfTheDayView.addSubview(pictureOfTheDayImageView)
        
        allContentView.addSubview(activtyIndicator)
        allContentView.addSubview(toBigPictureButton)
        
        NSLayoutConstraint.activate([
            pictureOfTheDayScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pictureOfTheDayScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pictureOfTheDayScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pictureOfTheDayScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            allContentView.topAnchor.constraint(equalTo: pictureOfTheDayScrollView.topAnchor),
            allContentView.leadingAnchor.constraint(equalTo: pictureOfTheDayScrollView.leadingAnchor),
            allContentView.trailingAnchor.constraint(equalTo: pictureOfTheDayScrollView.trailingAnchor),
            allContentView.bottomAnchor.constraint(equalTo: pictureOfTheDayScrollView.bottomAnchor),
            allContentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            allContentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//            allContentView.widthAnchor.constraint(equalTo: pictureOfTheDayScrollView.widthAnchor),
//            allContentView.heightAnchor.constraint(equalToConstant: 500),
            
            pictureOfTheDayView.topAnchor.constraint(equalTo: allContentView.topAnchor, constant: 20),
            pictureOfTheDayView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            pictureOfTheDayView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            pictureOfTheDayView.heightAnchor.constraint(equalToConstant: 300),
            
            pictureOfTheDayImageView.topAnchor.constraint(equalTo: pictureOfTheDayView.topAnchor),
            pictureOfTheDayImageView.leadingAnchor.constraint(equalTo: pictureOfTheDayView.leadingAnchor),
            pictureOfTheDayImageView.trailingAnchor.constraint(equalTo: pictureOfTheDayView.trailingAnchor),
            pictureOfTheDayImageView.bottomAnchor.constraint(equalTo: pictureOfTheDayView.bottomAnchor),
            
            toBigPictureButton.topAnchor.constraint(equalTo: pictureOfTheDayView.topAnchor),
            toBigPictureButton.leadingAnchor.constraint(equalTo: pictureOfTheDayView.leadingAnchor),
            toBigPictureButton.trailingAnchor.constraint(equalTo: pictureOfTheDayView.trailingAnchor),
            toBigPictureButton.bottomAnchor.constraint(equalTo: pictureOfTheDayView.bottomAnchor),
            
            dateLabelView.topAnchor.constraint(equalTo: pictureOfTheDayView.bottomAnchor, constant: 20),
            dateLabelView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor, constant: 20),
            dateLabelView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: dateLabelView.topAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: dateLabelView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: dateLabelView.trailingAnchor, constant: -20),
            dateLabel.bottomAnchor.constraint(equalTo: dateLabelView.bottomAnchor, constant: -20),
            
            activtyIndicator.centerXAnchor.constraint(equalTo: allContentView.centerXAnchor),
            activtyIndicator.centerYAnchor.constraint(equalTo: allContentView.centerYAnchor)
        ])
    }
    
}
