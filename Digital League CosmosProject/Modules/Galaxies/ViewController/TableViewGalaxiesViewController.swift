//
//  TableViewGalaxiesViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 01.04.2022.
//

import UIKit
import CoreData

class TableViewGalaxiesViewController: UIViewController {
    //MARK: - Properties
    private let cellId = "TableViewGalaxiesControllerCellId"
    
    private let arrayOfGalaxiesInformation = GalaxyInformationDataSource.shared.listOfGalaxiesInformation()
    private let arrayOfGalaxiesNames = GalaxyNameDataSource.shared.listOfGalaxiesNames()
    
    lazy var galaxiesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 500
        tableView.sectionHeaderHeight = 100
        //        tableView.rowHeight = UITableView.automaticDimension
        //        tableView.estimatedRowHeight = 1000
        tableView.backgroundColor = .clear
        
        tableView.register(GalaxyViewCell.self, forCellReuseIdentifier: cellId)
        
        return tableView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }

}

//MARK: - UITableViewDataSource
extension TableViewGalaxiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfGalaxiesInformation[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        arrayOfGalaxiesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? GalaxyViewCell else { return UITableViewCell()}
        
        let galaxy = arrayOfGalaxiesInformation[indexPath.section][indexPath.row]
        
        cell.smallViewGalaxyImage.image = galaxy.galaxyImage
        cell.bigViewGalaxyImage.image = galaxy.galaxyImage
        cell.informationLabel.text = galaxy.galaxyFact.rawValue
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension TableViewGalaxiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        GalaxiesHeaderController(galaxyHeaderModel: arrayOfGalaxiesNames[section]).viewHeader()
    }
    
}
