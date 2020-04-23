//
//  ViewController.swift
//  Redline
//
//  Created by AnnaThomas on 23/04/20.
//  Copyright © 2020 QBurst Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // IB Outlets
    @IBOutlet weak var redLineCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

// MARK: - UICollectionView Data Source
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RedlineCollectionViewCell.self), for: indexPath) as? RedlineCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
