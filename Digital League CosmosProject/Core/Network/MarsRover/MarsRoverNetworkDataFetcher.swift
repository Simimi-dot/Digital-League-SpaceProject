//
//  MarsRoverNetworkDataFetcher.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 30.03.2022.
//

import UIKit

//MARK: - fetchMarsRoverJSON
final class MarsRoverNetworkDataFetcher: SecondMarsRoverNetworkManagerProtocol {
    func fetchMarsRoverJSON(url: String, completion: @escaping (MarsRoverNetworkModel?, Error?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let marsRover = try JSONDecoder().decode(MarsRoverNetworkModel.self, from: data)
                completion(marsRover, nil)
                
            } catch let JSONError {
                completion(nil, JSONError)
            }
            
        }.resume()
    }
}

