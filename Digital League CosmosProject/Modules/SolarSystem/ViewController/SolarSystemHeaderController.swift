//
//  SolarSystemHeaderController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

class SolarSystemHeaderController {
    //MARK: - Properties
    private let spaceSystemNametModel: SpaceSystemNameModel
    
    //MARK: - Init
    init(spaceSystemNametModel: SpaceSystemNameModel) {
        self.spaceSystemNametModel = spaceSystemNametModel
    }
    
    //MARK: - Methods
    func viewHeader() -> UIView {
        let headerView = SolarSystemViewHeader()
        headerView.nameOfSystemLabel.text = spaceSystemNametModel.spaceSystem.rawValue
        return headerView
    }
}
