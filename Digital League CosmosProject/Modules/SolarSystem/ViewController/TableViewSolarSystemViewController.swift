//
//  TableViewSolarSystemViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 01.04.2022.
//

import UIKit

class TableViewSolarSystemViewController: UIViewController {
    //MARK: - Properties
    private let solarSystemCellId = "solarSystemCellId"
    
    private let arrayOfPlanets = PlanetDataSource.shared.listOfPlanets()
    private let arrayOfSpaceSystemNames = SpaceSystemNameDataSource.shared.listOfSpaceSystem()
    
    private let arrayOfPlanetsInformation = SolarSystemPlanetInformationDataSource.shared.listOfPlanetsInformation()
    
    lazy var solarSystemTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 250
        tableView.sectionHeaderHeight = 100
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(SolarSystemViewCell.self, forCellReuseIdentifier: solarSystemCellId)
        
        return tableView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

//MARK: - UITableViewDataSource
extension TableViewSolarSystemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfPlanets[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        arrayOfSpaceSystemNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: solarSystemCellId, for: indexPath)
                as? SolarSystemViewCell else { return UITableViewCell()}
        
        let planet = arrayOfPlanets[indexPath.section][indexPath.row]
        
        cell.planetImageView.image = planet.planetImage
        cell.nameOfPlanetLabel.text = planet.nameOfPlanet.rawValue
        cell.numberOfPlanetLabel.text = "Position: \(planet.positionFromTheSun.rawValue)"
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension TableViewSolarSystemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let planetInformationView =
        PlanetInformationController(planetModel: arrayOfPlanetsInformation[indexPath.row]).dataToView()
        
        let solarSystemPlanetInformationController =
        SolarSystemPlanetInformationViewController(customView: planetInformationView)
        
        solarSystemPlanetInformationController.title =
        arrayOfPlanetsInformation[indexPath.row].nameOfPlanet.rawValue
        
        navigationController?.pushViewController(solarSystemPlanetInformationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        SolarSystemHeaderController(spaceSystemNametModel: arrayOfSpaceSystemNames[section]).viewHeader()
    }
    
}
