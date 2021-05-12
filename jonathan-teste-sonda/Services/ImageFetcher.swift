//
//  ImageFetcher.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import Foundation
import UIKit
import Alamofire

class ImageFetcher {
    static func fetchImage(URL: String, completionHandler: @escaping(UIImage) -> Void) {
        
        var tempImage: UIImage = UIImage()
        
        _ = AF.request(URL, method: .get).response{ (response) in
            switch response.result {
            case .success(let responseData):
                tempImage = UIImage(data: responseData!, scale: 1) ?? tempImage
                completionHandler(tempImage)
            break
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
}
