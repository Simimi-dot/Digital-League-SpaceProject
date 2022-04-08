//
//  MarsRoverDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 27.03.2022.
//

import UIKit

//MARK: - listOfMarsRovers
final class MarsRoverDataSource {
    static let shared = MarsRoverDataSource()
    
    private init() {}
    
    func listOfMarsRovers() -> [MarsRoverModel] {
        let marsRoversArray: [MarsRoverModel] = [
            MarsRoverModel(roverImage: UIImage(named: "Curiosity"), roverName: .curiosity),
            MarsRoverModel(roverImage: UIImage(named: "Opportunity"), roverName: .opportunity),
            MarsRoverModel(roverImage: UIImage(named: "Spirit"), roverName: .spirit)
        ]
        
        return marsRoversArray
    }
}
