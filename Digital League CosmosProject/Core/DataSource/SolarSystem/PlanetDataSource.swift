//
//  PlanetDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit
import CoreData

//MARK: - listOfPlanets
final class PlanetDataSource {
    static let shared = PlanetDataSource()
    
    private init() {}
    
    func listOfPlanets() -> [[SolarSystemPlanetModel]] {
        let planetsArray: [[SolarSystemPlanetModel]] = [[
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.mercury.rawValue),
                nameOfPlanet: .mercury,
                positionFromTheSun: .mercury),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.venus.rawValue),
                nameOfPlanet: .venus,
                positionFromTheSun: .venus),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.earth.rawValue),
                nameOfPlanet: .earth,
                positionFromTheSun: .earth),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.mars.rawValue),
                nameOfPlanet: .mars,
                positionFromTheSun: .mars),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.jupiter.rawValue),
                nameOfPlanet: .jupiter,
                positionFromTheSun: .jupiter),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.saturn.rawValue),
                nameOfPlanet: .saturn,
                positionFromTheSun: .saturn),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.uranus.rawValue),
                nameOfPlanet: .uranus,
                positionFromTheSun: .uranus),
            SolarSystemPlanetModel(
                planetImage: UIImage(named: PlanetImageName.neptune.rawValue),
                nameOfPlanet: .neptune,
                positionFromTheSun: .neptune),
        ]]
        return planetsArray
    }
}
