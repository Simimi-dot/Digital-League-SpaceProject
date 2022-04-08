//
//  SolarSystemPlanetInformationViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 19.03.2022.
//

import UIKit

class SolarSystemPlanetInformationViewController: UIViewController {
    //MARK: - Properties
    private let customView: UIView
    
    //MARK: - Init
    init(customView: UIView) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = customView
        navigationItem.largeTitleDisplayMode = .automatic
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
