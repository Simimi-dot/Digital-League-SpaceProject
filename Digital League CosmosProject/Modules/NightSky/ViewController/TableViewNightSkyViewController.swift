//
//  TableViewNightSkyViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 10.04.2022.
//

import UIKit
import CoreData

class TableViewNightSkyViewController: UIViewController {
    //MARK: - Properies
    private let nightCellId = "NightCellId"
    
    private let navigationBarAppearance = NavigationBarAppearance()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var nightSkyPhotos: [NightSky] = []
    
    private lazy var nightSkyTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(NightSkyViewCell.self, forCellReuseIdentifier: nightCellId)
        
        return tableView
    }()
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Night Sky"
        
        custmizeNavigationBarAppearance()
        configureBarButtonItem()
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    //MARK: - Method
    private func custmizeNavigationBarAppearance() {
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance.customizeNavigationBarAppearance()
    }
    
    private func configureBarButtonItem() {
        let someButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModalViewController))
        someButton.tintColor = .white
        
        navigationItem.rightBarButtonItem = someButton
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<NightSky> = NightSky.fetchRequest()
        
        do {
            nightSkyPhotos = try context.fetch(fetchRequest)
            nightSkyTableView.reloadData()
        } catch let error {
            print(error)
        }
    }
    
    @objc
    private func showModalViewController() {
        let newPlanetViewController = NewNightSkyViewController()
        newPlanetViewController.modalPresentationStyle = .fullScreen
        navigationController?.present(newPlanetViewController, animated: true, completion: nil)
    }
    
}

//MARK: - ConfigureViewProtocol
extension TableViewNightSkyViewController: ConfigureViewProtocol {
    func configureView() {
        view.addSubview(nightSkyTableView)
        
        NSLayoutConstraint.activate([
            nightSkyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nightSkyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nightSkyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nightSkyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

//MARK: - UITableViewDataSource
extension TableViewNightSkyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nightSkyPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: nightCellId, for: indexPath)
                as? NightSkyViewCell else { return UITableViewCell() }
        
        guard let data = nightSkyPhotos[indexPath.row].nightSkyImage else { return UITableViewCell()}
        
        cell.nightSkyImage.image = UIImage(data: data)
        cell.nightSkyLabel.text = nightSkyPhotos[indexPath.row].newPhotoLabel
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension TableViewNightSkyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
}
