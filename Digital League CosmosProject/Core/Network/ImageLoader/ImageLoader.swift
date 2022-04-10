//
//  ImageLoader.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 03.04.2022.
//

import UIKit

//MARK: - Image Loader
final class ImageLoader {
    static let shared = ImageLoader()
    
    private let imageCache = NSCache<NSString, UIImage>()
    private let loadingQueue = DispatchQueue(label: "second image loading queue")
    
    private init() {}
}

//MARK: - loadImageFromData
extension ImageLoader {
    func loadImageFromData(url: URL, completion: @escaping (UIImage?) -> Void) {
        loadingQueue.async {
            if let image = self.imageCache.object(forKey: url.absoluteString as NSString) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
                
            }
            
        }
    }
}
