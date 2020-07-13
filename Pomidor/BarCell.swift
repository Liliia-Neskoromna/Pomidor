//
//  BarCell.swift
//  Pomidor
//
//  Created by Lilia on 7/11/20.
//  Copyright © 2020 Lilia. All rights reserved.
//

import UIKit

class BarCell: UICollectionViewCell {
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var barHeigthConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(barView)
        
        barHeigthConstraint = barView.heightAnchor.constraint(equalToConstant: 300)
        barHeigthConstraint?.isActive = true
        barHeigthConstraint?.constant = 100
        
        //barView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        barView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        barView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        barView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
