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
        // set background image for navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: Constants.navBarImage)?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // set image for left bar button item
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.backButtonImage), style:.plain, target: nil, action: nil)
        // set image for right bar button item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.searchButtonImage), style:.plain, target: nil, action: nil)
        // set title text attributes
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: Constants.regularFont, size: 20)!]

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
