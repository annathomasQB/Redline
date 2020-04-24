//
//  ViewController.swift
//  Redline
//
//  Created by AnnaThomas on 23/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    //Variables
    var viewModel = ViewControllerModel()
    
    
    // IB Outlets
    @IBOutlet weak var redLineCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // customize Navigation Bar appearance
        customizeNavigationBar()
        
        // get json data
        getData()
    }

    /// Function that gets the json data for display
    func getData() {
        viewModel.getNextSet {
            self.refreshContent()
            // set navigation page title
            self.navigationController?.navigationBar.topItem?.title = self.viewModel.getPageTitle()
        }
        
    }
    
    /// Function to customize the appearance of the navigation bar
    func customizeNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: Constants.navBarImage), for: .default)
    }

    /// Function to refresh collectionview data
    func refreshContent() {
        DispatchQueue.main.async {
            self.redLineCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionView Data Source
extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RedlineCollectionViewCell.self), for: indexPath) as? RedlineCollectionViewCell {
            cell.contentModel = viewModel.contentModel(at: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionView Delegate Flow Layout
extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: 0.3 * width, height: 200)
    }
}

// MARK: - UICollectionView Delegate
extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // check if about to reach second last row of current list
        if indexPath.row == viewModel.numberOfRows()-6 {
            self.getData()
        }
    }
}
