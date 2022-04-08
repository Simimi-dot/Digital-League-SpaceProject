//
//  APODBigPhotoControllerView.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 28.03.2022.
//

import UIKit

class APODBigPhotoControllerView: UIView {
    //MARK: - Properties
    private lazy var photoScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var allContentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var photoImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
extension APODBigPhotoControllerView: ConfigureViewProtocol {
    func configureView() {
        addSubview(photoScrollView)
        photoScrollView.addSubview(allContentView)
        allContentView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoScrollView.topAnchor.constraint(equalTo: topAnchor),
            photoScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            allContentView.topAnchor.constraint(equalTo: photoScrollView.topAnchor),
            allContentView.leadingAnchor.constraint(equalTo: photoScrollView.leadingAnchor),
            allContentView.trailingAnchor.constraint(equalTo: photoScrollView.trailingAnchor),
            allContentView.bottomAnchor.constraint(equalTo: photoScrollView.bottomAnchor),
            allContentView.heightAnchor.constraint(equalToConstant: 1500),
            allContentView.widthAnchor.constraint(equalToConstant: 1500),
            
            photoImageView.topAnchor.constraint(equalTo: allContentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: allContentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: allContentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: allContentView.bottomAnchor)
        ])
    }
    
}
