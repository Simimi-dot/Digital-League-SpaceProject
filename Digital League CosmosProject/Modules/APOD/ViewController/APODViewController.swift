//
//  APODViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 28.03.2022.
//

import UIKit

class APODViewController: UIViewController {
    //MARK: - Properties
    private let navigationBarAppearance = NavigationBarAppearance()
    
    private let apodControllerView = APODControllerView()
    private let apodNetworkManager = APODDataFetcher()
    
    private var fetchDataApodArray: APODNetworkModel?
    private var secondApodImageUrl: URL?
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.largeTitleDisplayMode = .automatic
        
        self.view = apodControllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "APOD"
        navigationController?.navigationBar.prefersLargeTitles = true
        custmizeNavigationBarAppearance()
        photoAlert()
        
        fetchAPODJson()
        
        apodControllerView.toBigPictureButton.addTarget(self, action: #selector(toBigPicture), for: .touchUpInside)
    }
    
    //MARK: - Methods
    private func custmizeNavigationBarAppearance() {
        navigationController?.navigationBar.standardAppearance =
        navigationBarAppearance
            .customizeNavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance =
        navigationBarAppearance
            .customizeNavigationBarAppearance()
        navigationController?.navigationBar.compactAppearance =
        navigationBarAppearance
            .customizeNavigationBarAppearance()
    }
    
    
    private func fetchAPODJson() {
        apodNetworkManager.fetchAPODJSON { [weak self] apod, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let apod = apod else {
                return
            }
            
            self.fetchDataApodArray = apod
            
            guard let url = URL(string: self.fetchDataApodArray?.hdurl ?? "") else {
                return
            }
            
            self.secondApodImageUrl = url
            
            ImageLoader.shared.loadImageFromData(url: url) { image in
                DispatchQueue.main.async {
                    self.apodControllerView.pictureOfTheDayImageView.image = image
                }
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.apodControllerView.dateLabel.text = self.fetchDataApodArray?.date
                self.apodControllerView.activtyIndicator.stopAnimating()
                self.apodControllerView.dateLabelView.isHidden = false
            }
        }
    }
    
    private func photoAlert() {
        let alert = UIAlertController(
            title: "Происходит загрузка",
            message: "Подождите пока фотография дня загружается",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "Хорошо",
            style: .default,
            handler: nil))
        self.present(
            alert,
            animated: true,
            completion: nil)
    }
    
    //MARK: - @objc
    @objc
    private func toBigPicture() {
        let apodPhotoController = APODBigPhotoViewController()
        
        guard let url = secondApodImageUrl else { return }
        ImageLoader.shared.loadImageFromData(url: url) { image in
            DispatchQueue.main.async {
                apodPhotoController.apodPhotoControllerView.photoImageView.image = image
            }
        }

        navigationController?.pushViewController(apodPhotoController, animated: true)
    }
    
}
