//
//  MarsRoverUrlDataSource.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 27.03.2022.
//

import UIKit

//MARK: - marsRoverUrlArray
final class MarsRoverUrlDataSource {
    static let shared = MarsRoverUrlDataSource()
    
    private init() {}
    
    func marsRoverUrlArray() -> [MarsRoverUrlModel] {
        let urlArray: [MarsRoverUrlModel] = [
            MarsRoverUrlModel(url: .curiosity),
            MarsRoverUrlModel(url: .opportunity),
            MarsRoverUrlModel(url: .spirit)
        ]
        return urlArray
    }
}
