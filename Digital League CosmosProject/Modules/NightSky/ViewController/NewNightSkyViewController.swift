//
//  NewNightSkyViewController.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 10.04.2022.
//

import UIKit
import CoreData

class NewNightSkyViewController: UIViewController {
    //MARK: - Properties
    private let customView = NewNightSkyView()
    private let tableViewNightSkyViewController = TableViewNightSkyViewController()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: - Life Cycle
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.photoButton.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
        customView.newPlanetButton.addTarget(self, action: #selector(saveNewNightSkyPhoto), for: .touchUpInside)
    }
    
    //MARK: - Methods
    private func takePhotoAlertController() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    @objc
    private func saveNewNightSkyPhoto() {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "NightSky", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: context) as? NightSky else { return }
        
        task.nightSkyImage = customView.nightSkyImageView.image?.pngData()
        task.newPhotoLabel = customView.newPhotoTextField.text
        
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func takePhoto() {
        takePhotoAlertController()
    }
    
}

//MARK: - UIImagePickerControllerDelegate
extension NewNightSkyViewController: UIImagePickerControllerDelegate {
    private func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        customView.nightSkyImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - UINavigationControllerDelegate
extension NewNightSkyViewController: UINavigationControllerDelegate { }
