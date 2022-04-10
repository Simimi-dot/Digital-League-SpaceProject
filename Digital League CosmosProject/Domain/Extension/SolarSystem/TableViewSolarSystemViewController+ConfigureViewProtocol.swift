//
//  TableViewSolarSystemViewController+ConfigureViewProtocol.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 01.04.2022.
//

import UIKit

//MARK: - ConfigureViewProtocol
extension TableViewSolarSystemViewController: ConfigureViewProtocol {
    func configureView() {
        view.addSubview(solarSystemTableView)
        
        NSLayoutConstraint.activate([
            solarSystemTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            solarSystemTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            solarSystemTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            solarSystemTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
