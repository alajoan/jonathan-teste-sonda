//
//  MainCollectionViewController.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import UIKit


class MainCollectionViewController: MainPresenterDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let presenter = MainPresenter()
    
    var albums: [AlbumData] = []
    var alert : UIAlertController!
    var activityIndicator : UIActivityIndicatorView!
    
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    func presentAlbums(albums: [AlbumData]) {
        self.albums = albums
        //Delay added for loading testing
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.mainCollectionView.reloadData()
            LoadingStatus.showUniversalLoadingView(false)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func popCamera(_ sender: UIButton) {
       
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        self.present(imagePickerController, animated: true, completion: nil)
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        presenter.setViewDelegate(delegate: self)
        presenter.fetchAlbum()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LoadingStatus.showUniversalLoadingView(true, loadingText: "Downloading Data.......")
    }
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return albums.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let album = albums[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! MainCollectionViewCell
    
        // Configure the cell
        cell.setCell(album: album)
        return cell
    }


}
