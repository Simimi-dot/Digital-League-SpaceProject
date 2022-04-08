//
//  GalaxyInformationDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

//MARK: - listOfGalaxiesInformation
final class GalaxyInformationDataSource {
    static let shared = GalaxyInformationDataSource()
    
    private init() {}
    
    func listOfGalaxiesInformation() -> [[GalaxyInformationModel]] {
        let galaxiesInformationArray: [[GalaxyInformationModel]] = [
            [GalaxyInformationModel(galaxyImage: UIImage(named: "MilkyWay"), galaxyFact: .milkyWay)],
            [GalaxyInformationModel(galaxyImage: UIImage(named: "Messier54"), galaxyFact: .messier54)],
            [GalaxyInformationModel(galaxyImage: UIImage(named: "AndromedaNebula"), galaxyFact: .andromedaNebula)],
            [GalaxyInformationModel(galaxyImage: UIImage(named: "TriangleGalaxy"), galaxyFact: .triangleGalaxy)],
            [GalaxyInformationModel(galaxyImage: UIImage(named: "CentauriA"), galaxyFact: .centauriA)],
            [GalaxyInformationModel(galaxyImage: UIImage(named: "Messier105"), galaxyFact: .messier105)],
            [GalaxyInformationModel(galaxyImage: UIImage(named: "NGC4449"), galaxyFact: .ngc4449)]
        ]
        return galaxiesInformationArray
    }
}
