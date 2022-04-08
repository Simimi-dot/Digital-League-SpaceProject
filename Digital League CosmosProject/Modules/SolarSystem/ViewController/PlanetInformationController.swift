//
//  PlanetInformationController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

class PlanetInformationController {
    //MARK: - Properties
    private let planetModel: SolarSystemPlanetInformationModel
    
    //MARK: - Init
    init(planetModel: SolarSystemPlanetInformationModel) {
        self.planetModel = planetModel
    }
    
    //MARK: - Methods
    func dataToView() -> UIView {
        let planetInformationView = SolarSystemPlanetInfromationControllerView()
        planetInformationView.planetImageView.image = planetModel.planetImage
        planetInformationView.oneYearPeriodLabel.text = planetModel.oneYearPeriod.rawValue
        planetInformationView.spinPeriodLabel.text = planetModel.spinPeriod.rawValue
        planetInformationView.interestingInformationLabel.text = planetModel.planetFact.rawValue
        return planetInformationView
    }
}
