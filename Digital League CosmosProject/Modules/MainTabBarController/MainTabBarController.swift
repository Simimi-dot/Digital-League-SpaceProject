//
//  MainTabBarController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 18.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    //MARK: - Prperties
    private let mainGalaxiesController = UINavigationController(rootViewController: MainGalaxiesViewController())
    private let mainSolarSystemController = UINavigationController(rootViewController: MainSolarSystemViewController())
    private let mainMarsRoverController = UINavigationController(rootViewController: MainMarsRoverViewController())
    private let apodController = UINavigationController(rootViewController: APODViewController())
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers(
            [mainGalaxiesController, mainSolarSystemController, mainMarsRoverController, apodController],
                                animated: true)
        
        customizeTabBar()
        customizeTabBarImage()
        customizeBackGround()
    }
    
    //MARK: - Methods
    private func customizeTabBar() {
        mainGalaxiesController.title = "Galaxies"
        mainSolarSystemController.title = "Solar System"
        mainMarsRoverController.title = "Mars Rover"
        apodController.title = "APOD"
        
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .lightGray
    }
    
    private func customizeTabBarImage() {
        guard let items = tabBar.items else { return }
        
        let arrayOfImages = ["Galaxy", "Planet", "MarsRover", "APOD"]

        for index in 0..<arrayOfImages.count {
            items[index].image = UIImage(named: arrayOfImages[index])
        }
    }
    
    private func customizeBackGround() {
        let backGroundImageView = UIImageView(image: UIImage(named: "BackgroundSpace"))
        backGroundImageView.frame = view.frame
        backGroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backGroundImageView)
        view.sendSubviewToBack(backGroundImageView)
    }
    
}
