//
//  SolarSystemNewPlanetViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 10.04.2022.
//

import UIKit

class SolarSystemNewPlanetViewController: UIViewController {
    //MARK: - Properties
    let customView = SolarSystemNewPlanetView()
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - Methods
    
}
