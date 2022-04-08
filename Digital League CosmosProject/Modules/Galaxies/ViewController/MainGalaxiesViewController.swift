//
//  MainGalaxiesViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 01.04.2022.
//

import UIKit

class MainGalaxiesViewController: UIViewController {    
    //MARK: - Properties
    private let navigationBarAppearance = NavigationBarAppearance()
    private var childTableViewGalaxiesController: UIViewController!
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Galaxies"
        
        custmizeNavigationBarAppearance()
        addChildViewController()
    }
    
    //MARK: - Methods
    private func custmizeNavigationBarAppearance() {
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
    }
    
    private func addChildViewController() {
        childTableViewGalaxiesController = TableViewGalaxiesViewController()
        addChild(childTableViewGalaxiesController)
        view.addSubview(childTableViewGalaxiesController.view)
        childTableViewGalaxiesController.didMove(toParent: self)
        
    }
    
}
