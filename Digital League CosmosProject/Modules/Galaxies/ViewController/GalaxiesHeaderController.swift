//
//  GalaxiesHeaderController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

final class GalaxiesHeaderController {
    //MARK: - Properties
    private let galaxyHeaderModel: GalaxyNameModel
    
    //MARK: - Init
    init(galaxyHeaderModel: GalaxyNameModel) {
        self.galaxyHeaderModel = galaxyHeaderModel
    }
    
    //MARK: - Methods
    func viewHeader() -> UIView {
        let headerView = GalaxyViewHeader()
        headerView.nameOfGalaxyLabel.text = galaxyHeaderModel.galaxyName.rawValue
        return headerView
    }
}
