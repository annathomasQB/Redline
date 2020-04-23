//
//  ViewController.swift
//  Redline
//
//  Created by AnnaThomas on 23/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    var viewModel = ViewControllerModel()
    
    
    // IB Outlets
    @IBOutlet weak var redLineCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // get json data
        getData()
    }

    /// Function that gets the json data for display
    func getData() {
        viewModel.getJsonData()
    }

}

// MARK: - UICollectionView Data Source
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RedlineCollectionViewCell.self), for: indexPath) as? RedlineCollectionViewCell {
            cell.contentModel = viewModel.contentModel(at: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionView Delegate Flow Layout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: 0.3 * width, height: 200)
    }
}

// MARK: - UICollectionView Delegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row ==
    }
}
