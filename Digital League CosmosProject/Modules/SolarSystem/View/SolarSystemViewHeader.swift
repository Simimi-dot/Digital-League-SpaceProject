//
//  SolarSystemViewHeader.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 24.03.2022.
//

import UIKit

class SolarSystemViewHeader: UITableViewHeaderFooterView {
    //MARK: - Properties
    private lazy var customHeaderView: UIView = {
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
    
    lazy var nameOfSystemLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var customHeaderViewGradentLayer: CAGradientLayer = {
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
        
        customHeaderView.layoutIfNeeded()
        customHeaderViewGradentLayer.frame = customHeaderView.bounds
    }
    
    //MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
        configureHeaderBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ConfigureHeaderBackgroundProtocol
extension SolarSystemViewHeader: ConfigureHeaderBackgroundProtocol {
    func configureHeaderBackgroundColor() {
        let headerBackgroundView = UIView(frame: self.bounds)
        headerBackgroundView.backgroundColor = UIColor(white: 1, alpha: 0.0)
        self.backgroundView = headerBackgroundView
    }
}

//MARK: - ConfigureViewProtocol
extension SolarSystemViewHeader: ConfigureViewProtocol {
    func configureView() {
        contentView.addSubview(customHeaderView)
        customHeaderView.layer.addSublayer(customHeaderViewGradentLayer)
        
        customHeaderView.addSubview(nameOfSystemLabel)
        
        NSLayoutConstraint.activate([
            customHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            customHeaderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            nameOfSystemLabel.topAnchor.constraint(equalTo: customHeaderView.topAnchor, constant: 20),
            nameOfSystemLabel.leadingAnchor.constraint(equalTo: customHeaderView.leadingAnchor, constant: 20),
            nameOfSystemLabel.trailingAnchor.constraint(equalTo: customHeaderView.trailingAnchor, constant: -20),
            nameOfSystemLabel.bottomAnchor.constraint(equalTo: customHeaderView.bottomAnchor, constant: -20),
        ])
    }
}
