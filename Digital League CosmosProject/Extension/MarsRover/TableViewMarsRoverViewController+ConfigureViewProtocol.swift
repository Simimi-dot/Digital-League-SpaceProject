//
//  TableViewMarsRoverViewController+ConfigureViewProtocol.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

//MARK: - ConfigureViewProtocol
extension TableViewMarsRoverViewController: ConfigureViewProtocol {
    func configureView() {
        view.addSubview(marsRoverTableView)
        
        NSLayoutConstraint.activate([
            marsRoverTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            marsRoverTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            marsRoverTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            marsRoverTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
