//
//  MainMarsRoverViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

class MainMarsRoverViewController: UIViewController {
    //MARK: - Properties
    private let navigationBarAppearance = NavigationBarAppearance()
    private var childTableViewMarsRoverController: UIViewController!
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        custmizeNavigationBarAppearance()
        addChildViewController()

        title = "Mars Rover"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 0.25
        }
    }
    
    //MARK: - Methods
    private func custmizeNavigationBarAppearance() {
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
    }
    
    private func addChildViewController() {
        childTableViewMarsRoverController = TableViewMarsRoverViewController()
        addChild(childTableViewMarsRoverController)
        view.addSubview(childTableViewMarsRoverController.view)
        childTableViewMarsRoverController.didMove(toParent: self)
    }
}
