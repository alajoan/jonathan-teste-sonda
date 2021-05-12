//
//  MainPresenter.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import Foundation
import UIKit
import Alamofire

protocol UserPresenterDelegate: AnyObject{
    func presentAlbums(albums: [AlbumData])
}

typealias MainPresenterDelegate = UserPresenterDelegate & UIViewController

class MainPresenter {
    
    weak var delegate: MainPresenterDelegate?
    
    public func setViewDelegate(delegate: MainPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func fetchAlbum(){
        
        let url = "https://jsonplaceholder.typicode.com/photos"
        let request = AF.request(url)
        
        request.responseJSON { (response) in
            
            switch response.result {
            
            case .success:
                do {
                    let album = try JSONDecoder().decode([AlbumData].self, from: response.data!)
                    self.delegate?.presentAlbums(albums: album)
                    
                } catch DecodingError.keyNotFound(let key, let context) {
                    Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                } catch DecodingError.valueNotFound(let type, let context) {
                    Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.typeMismatch(let type, let context) {
                    Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.dataCorrupted(let context) {
                    Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                } catch let error as NSError {
                    NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                }
                break
                
            case .failure(let error):
                print("Deu erro: \(error.localizedDescription) \(String(describing: error.failedStringEncoding))")
            break
            }
            
        }
    }
    
}
