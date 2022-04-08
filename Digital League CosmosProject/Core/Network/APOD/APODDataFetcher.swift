//
//  APODDataFetcher.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 30.03.2022.
//

import UIKit

//MARK: - fetchAPODJSON
final class APODDataFetcher: APODNetworkManagerProtocol {
    private let apodUrl = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
    
    func fetchAPODJSON(completion: @escaping (APODNetworkModel?, Error?) -> Void) {
        
        guard let url = URL(string: apodUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let apod = try JSONDecoder().decode(APODNetworkModel.self, from: data)
                completion(apod, nil)
                
            } catch let JSONError {
                completion(nil, JSONError)
            }

        }.resume()
    }
}
