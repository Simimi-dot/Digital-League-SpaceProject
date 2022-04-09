//
//  NavigationBarAppearance.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 18.03.2022.
//

import UIKit
//MARK: - NavigationBarAppearance
struct NavigationBarAppearance {
    func customizeNavigationBarAppearance() -> UINavigationBarAppearance {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 45, weight: .bold)]
        return navigationBarAppearance
    }
}
