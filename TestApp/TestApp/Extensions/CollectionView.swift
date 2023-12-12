//
//  CollectionView.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cell: T.Type) {
        
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

// MARK: - Dynamic size of UICollectionView cells
class ContentSizedCollectionView : UICollectionView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}
