//
//  APODBigPhotoViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 28.03.2022.
//

import UIKit

class APODBigPhotoViewController: UIViewController {
    //MARK: - Properties
    let apodPhotoControllerView = APODBigPhotoControllerView()
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = apodPhotoControllerView
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture of the Day"
    }
    
}
