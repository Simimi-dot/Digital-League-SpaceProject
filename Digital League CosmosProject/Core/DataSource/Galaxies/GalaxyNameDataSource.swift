//
//  GalaxyNameDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

//MARK: - listOfGalaxiesNames
final class GalaxyNameDataSource {
    static let shared = GalaxyNameDataSource()
    
    private init() {}
    
    func listOfGalaxiesNames() -> [GalaxyNameModel] {
        let galaxiesNamesArray: [GalaxyNameModel] = [
            GalaxyNameModel(galaxyName: .milkyWay),
            GalaxyNameModel(galaxyName: .messier54),
            GalaxyNameModel(galaxyName: .andromedaNebula),
            GalaxyNameModel(galaxyName: .triangleGalaxy),
            GalaxyNameModel(galaxyName: .centauriA),
            GalaxyNameModel(galaxyName: .messier54),
            GalaxyNameModel(galaxyName: .ngc4449)
        ]
        return galaxiesNamesArray
    }
}
