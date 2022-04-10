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
    private let tableViewSolarSystemViewController = UINavigationController(rootViewController: TableViewSolarSystemViewController())
    private let mainMarsRoverController = UINavigationController(rootViewController: MainMarsRoverViewController())
    private let apodController = UINavigationController(rootViewController: APODViewController())
    private let nightSkyController = UINavigationController(rootViewController: TableViewNightSkyViewController())
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers(
            [mainGalaxiesController, tableViewSolarSystemViewController, mainMarsRoverController, apodController, nightSkyController],
                                animated: true)
        
        customizeTabBar()
        customizeTabBarImage()
        customizeBackGround()
    }
    
    //MARK: - Methods
    private func customizeTabBar() {
        mainGalaxiesController.title = "Galaxies"
        tableViewSolarSystemViewController.title = "Solar System"
        mainMarsRoverController.title = "Mars Rover"
        apodController.title = "APOD"
        nightSkyController.title = "Night Sky"
        
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .lightGray
    }
    
    private func customizeTabBarImage() {
        guard let items = tabBar.items else { return }
        
        let arrayOfImages = ["Galaxy", "Planet", "MarsRover", "APOD", "NightSky"]

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
