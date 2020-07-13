//
//  BarChar.swift
//  Pomidor
//
//  Created by Lilia on 7/11/20.
//  Copyright © 2020 Lilia. All rights reserved.
//

import Foundation
import UIKit

class BarChartViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let values: [CGFloat] = [400, 500, 600, 700, 550, 350, 420, 130, 490, 190, 240, 550, 350, 420, 130, 490, 190]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(BarCell.self, forCellWithReuseIdentifier: cellId)
        (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func maxHeight() -> CGFloat {
        return view.frame.height - 20 - 44 - 50
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> BarCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BarCell
        if let max = values.max() {
            let value = values[indexPath.item]
            let ratio = value / max
            cell.barHeigthConstraint?.constant = maxHeight() * ratio
        }
        
       // cell.barHeigthConstraint?.constant = values[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: view.frame.height - 20 - 44 - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 12, bottom: 0, right: 12)
    }
}

