//
//  MainCollectionViewCell.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    
    func setCell(album: AlbumData) {
        ImageFetcher.fetchImage(URL: album.thumbnailUrl) { (image) in
            self.albumImage.image = image
        }
        albumTitle.text = album.title
    }
}
