//
//  MarsRoverPhotoControllerViewCell.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 19.03.2022.
//

import UIKit

class MarsRoverPhotoControllerViewCell: UICollectionViewCell {
    //MARK: - Properties
    private lazy var viewForImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.masksToBounds = false
        
        return view
    }()
    
    lazy var photoImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        
        return image
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    //MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ConfigureViewProtocol
extension MarsRoverPhotoControllerViewCell: ConfigureViewProtocol {
    func configureView() {
        contentView.addSubview(viewForImage)
        viewForImage.addSubview(photoImageView)

        NSLayoutConstraint.activate([
            viewForImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewForImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewForImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewForImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            photoImageView.topAnchor.constraint(equalTo: viewForImage.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor, constant: 1),
            photoImageView.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor),
        ])
        
    }
    
}
