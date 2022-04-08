//
//  MainSolarSystemViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 01.04.2022.
//

import UIKit

class MainSolarSystemViewController: UIViewController {
    //MARK: - Properties
    private let navigationBarAppearance = NavigationBarAppearance()
    private var childTableViewSolarSystemController: UIViewController!
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Solar System"
        
        custmizeNavigationBarAppearance()
        addChildViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 0
        }
    }
    
    //MARK: - Methods
    private func custmizeNavigationBarAppearance() {
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
    }
    
    private func addChildViewController() {
        childTableViewSolarSystemController = TableViewSolarSystemViewController()
        addChild(childTableViewSolarSystemController)
        view.addSubview(childTableViewSolarSystemController.view)
        childTableViewSolarSystemController.didMove(toParent: self)
    }
}
