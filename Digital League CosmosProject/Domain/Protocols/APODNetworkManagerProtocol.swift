//
//  APODNetworkManagerProtocol.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 28.03.2022.
//

import UIKit
//MARK: - SecondAPODNetworkProtocol
protocol APODNetworkManagerProtocol {
    func fetchAPODJSON(completion: @escaping (APODNetworkModel?, Error?) -> Void)
}
