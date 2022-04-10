//
//  MarsRoverPhotoViewController+ConfigureViewProtocol.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 27.03.2022.
//

import UIKit

//MARK: - ConfigureViewProtocol
extension MarsRoverPhotoViewController: ConfigureViewProtocol {
    func configureView() {
        view.addSubview(marsRoverPhotoCollectionView)
        view.addSubview(activtyIndicator)
        
        NSLayoutConstraint.activate([
            marsRoverPhotoCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            marsRoverPhotoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            marsRoverPhotoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            marsRoverPhotoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activtyIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activtyIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
