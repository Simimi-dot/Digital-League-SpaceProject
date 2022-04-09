//
//  TableViewMarsRoverViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 02.04.2022.
//

import UIKit

class TableViewMarsRoverViewController: UIViewController {
    //MARK: - Properties
    private let marsRoverCellId = "MarsRoverCellId"
    
    private let arrayOfRovers = MarsRoverDataSource.shared.listOfMarsRovers()
    private let arrayOfUrlRovers = MarsRoverUrlDataSource.shared.marsRoverUrlArray()
    
    lazy var marsRoverTableView: UITableView = {
       var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(MarsRoverViewCell.self, forCellReuseIdentifier: marsRoverCellId)
        
        return tableView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}

//MARK: - UITableViewDataSource
extension TableViewMarsRoverViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfRovers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: marsRoverCellId, for: indexPath)
        as? MarsRoverViewCell else { return UITableViewCell() }
        
        let marsRover = arrayOfRovers[indexPath.row]
        
        cell.bigViewRoverImage.image = marsRover.roverImage
        cell.smallViewRoverImage.image = marsRover.roverImage
        cell.marsRoverNameLabel.text = marsRover.roverName.rawValue
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension TableViewMarsRoverViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let urlIndex = arrayOfUrlRovers[indexPath.row].url.rawValue
        
        navigationController?.pushViewController(MarsRoverPhotoViewController(urlIndex: urlIndex), animated: true)
    }
}

