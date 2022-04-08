//
//  MarsRoverPhotoInformationViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 27.03.2022.
//

import UIKit

class MarsRoverPhotoInformationViewController: UIViewController {
    //MARK: - Properties
    var marsRoverPhotoInformationControllerView = MarsRoverPhotoInformationControllerView()
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = marsRoverPhotoInformationControllerView
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
