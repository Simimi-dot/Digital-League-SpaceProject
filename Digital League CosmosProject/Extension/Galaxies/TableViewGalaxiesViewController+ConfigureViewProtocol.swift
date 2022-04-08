//
//  TableViewGalaxiesViewController+ConfigureViewProtocol.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 01.04.2022.
//

import UIKit

//MARK: - ConfigureViewProtocol
extension TableViewGalaxiesViewController: ConfigureViewProtocol {
    func configureView() {
        view.addSubview(galaxiesTableView)
        
        NSLayoutConstraint.activate([
            galaxiesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            galaxiesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galaxiesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galaxiesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
