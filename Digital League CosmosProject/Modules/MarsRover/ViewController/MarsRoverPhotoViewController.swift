//
//  MarsRoverPhotoViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 19.03.2022.
//

import UIKit

class MarsRoverPhotoViewController: UIViewController {
    //MARK: - Properties
    private let marsRoverPhotoCellId = "marsRoverPhotoCellId"
    
    private let marsRoverNetworkDataFetcher = MarsRoverNetworkDataFetcher()
    private let marsRoerPhotoControllerViewCell = MarsRoverPhotoControllerViewCell()
    
    private let urlIndex: String
    
    private var fetchDataMarsRoverArray: [Photo] = []
    
    private var arrayOfImageUrl: [URL] = []
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        var flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.minimumInteritemSpacing = 2
        flow.minimumLineSpacing = 3
        //flow.itemSize = CGSize(width: 80, height: 80)
        flow.itemSize = CGSize(width: (view.frame.size.width/3) - 4, height: (view.frame.size.width/3) - 4)
        return flow
    }()
    
    lazy var marsRoverPhotoCollectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        collectionView.register(MarsRoverPhotoControllerViewCell.self, forCellWithReuseIdentifier: marsRoverPhotoCellId)
        
        return collectionView
    }()
    
    lazy var activtyIndicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .white
        return indicator
    }()
    
    //MARK: - Init
    init(urlIndex: String) {
        self.urlIndex = urlIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Фотографии"
        
        configureView()
        activtyIndicator.startAnimating()
        
        fetchMarsRoverJSON()
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
    private func fetchMarsRoverJSON() {
        marsRoverNetworkDataFetcher.fetchMarsRoverJSON(url: urlIndex) { [weak self] marsRover, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let marsRover = marsRover else {
                return
            }
            
            self.fetchDataMarsRoverArray = marsRover.photos
            
            for index in 0..<self.fetchDataMarsRoverArray.count {
                guard let url = URL(string: self.fetchDataMarsRoverArray[index].imgSrc) else { return }
                self.arrayOfImageUrl.append(url)
            }
            
            DispatchQueue.main.async {
                self.photoAlert(photo: self.arrayOfImageUrl.count)
                self.activtyIndicator.stopAnimating()
                self.marsRoverPhotoCollectionView.reloadData()
            }
        }
    }
    
    private func photoAlert(photo: Int) {
        let alert = UIAlertController(
            title: "Загрузка закончена",
            message: "Загрузилось \(arrayOfImageUrl.count) фотографий с Марса",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "Круто",
            style: .default,
            handler: nil))
        self.present(
            alert,
            animated: true,
            completion: nil)
    }
    
}

//MARK: - UICollectionViewDataSource
extension MarsRoverPhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfImageUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: marsRoverPhotoCellId, for: indexPath)
                as? MarsRoverPhotoControllerViewCell else { return UICollectionViewCell()}
        
        ImageLoader.shared.loadImageFromData(url: arrayOfImageUrl[indexPath.row]) { image in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.0, animations: {
                    cell.photoImageView.frame = cell.frame
                })
                    
                cell.photoImageView.image = image
            }
        }
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension MarsRoverPhotoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let marsRoverPhotoInformationController = MarsRoverPhotoInformationViewController()
      
        ImageLoader.shared.loadImageFromData(url: arrayOfImageUrl[indexPath.row]) { image in
            DispatchQueue.main.async {
                marsRoverPhotoInformationController.marsRoverPhotoInformationControllerView.photoImage.image = image
            }
        }
        
        marsRoverPhotoInformationController
            .marsRoverPhotoInformationControllerView
            .eartDateLabel
            .text = fetchDataMarsRoverArray[indexPath.section]
            .earthDate
        marsRoverPhotoInformationController
            .marsRoverPhotoInformationControllerView
            .abbreviationСameraLabel
            .text = fetchDataMarsRoverArray[indexPath.section]
            .camera
            .name
        marsRoverPhotoInformationController
            .marsRoverPhotoInformationControllerView
            .fullNameСameraLabel
            .text = fetchDataMarsRoverArray[indexPath.section]
            .camera
            .fullName
        
        navigationController?.pushViewController(marsRoverPhotoInformationController, animated: true)
    }
}
