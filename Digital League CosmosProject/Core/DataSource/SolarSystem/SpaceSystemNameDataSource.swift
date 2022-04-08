//
//  SpaceSystemNameDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

//MARK: - listOfSpaceSystem
final class SpaceSystemNameDataSource {
    static let shared = SpaceSystemNameDataSource()
    
    private init() {}
    
    func listOfSpaceSystem() -> [SpaceSystemNameModel] {
        let listOfSpaceSystem: [SpaceSystemNameModel] = [
            SpaceSystemNameModel(spaceSystem: .solarSystem)
        ]
        return listOfSpaceSystem
    }
}
