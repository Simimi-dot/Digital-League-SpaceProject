//
//  SolarSystemPlanetInformationDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

//MARK: - listOfPlanetsInformation
final class SolarSystemPlanetInformationDataSource {
    static let shared = SolarSystemPlanetInformationDataSource()
    
    private init() {}
    
    func listOfPlanetsInformation() -> [SolarSystemPlanetInformationModel] {
        let planetInformationArray: [SolarSystemPlanetInformationModel] = [
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.mercury.rawValue),
                nameOfPlanet: .mercury,
                oneYearPeriod: .mercury,
                spinPeriod: .mercury,
                planetFact: .mercury),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.venus.rawValue),
                nameOfPlanet: .venus,
                oneYearPeriod: .venus,
                spinPeriod: .venus,
                planetFact: .venus),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.earth.rawValue),
                nameOfPlanet: .earth,
                oneYearPeriod: .earth,
                spinPeriod: .earth,
                planetFact: .earth),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.mars.rawValue),
                nameOfPlanet: .mars,
                oneYearPeriod: .mars,
                spinPeriod: .mars,
                planetFact: .mars),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.jupiter.rawValue),
                nameOfPlanet: .jupiter,
                oneYearPeriod: .jupiter,
                spinPeriod: .jupiter,
                planetFact: .jupiter),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.saturn.rawValue),
                nameOfPlanet: .saturn,
                oneYearPeriod: .saturn,
                spinPeriod: .saturn,
                planetFact: .saturn),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.uranus.rawValue),
                nameOfPlanet: .uranus,
                oneYearPeriod: .uranus,
                spinPeriod: .uranus,
                planetFact: .uranus),
            SolarSystemPlanetInformationModel(
                planetImage: UIImage(named: PlanetImageName.neptune.rawValue),
                nameOfPlanet: .neptune,
                oneYearPeriod: .neptune,
                spinPeriod: .neptune,
                planetFact: .neptune),
        ]
        return planetInformationArray
    }
}
