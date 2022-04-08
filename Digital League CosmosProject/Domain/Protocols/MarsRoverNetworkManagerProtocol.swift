//
//  MarsRoverNetworkManagerProtocol.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 27.03.2022.
//

import UIKit
//MARK: - SecondMarsRoverNetworkManagerProtocol
protocol SecondMarsRoverNetworkManagerProtocol {
    func fetchMarsRoverJSON(url: String, completion: @escaping (MarsRoverNetworkModel?, Error?) -> Void)
}
