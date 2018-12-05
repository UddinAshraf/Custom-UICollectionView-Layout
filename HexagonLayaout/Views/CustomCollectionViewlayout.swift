//
//  CustomCollectionViewlayout.swift
//  HexagonLayaout
//
//  Created by BS126 on 12/3/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionViewlayout: UICollectionViewLayout  {
    
    fileprivate var cellPadding: CGFloat = 10
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let contentInsets = collectionView.contentInset
        return collectionView.bounds.width - (contentInsets.left + contentInsets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView  else {
            return
        }
        
        let itemWidth:CGFloat = 150.0
        let itemHeight:CGFloat = 160.0
        let centerPoint: CGFloat = collectionView.bounds.width / 2
        //var xOFfsetForOddRow = [CGFloat]()
        var yOffset: CGFloat = 30.0
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexpath = IndexPath(item: item, section: 0)
            var frame: CGRect
            if item % 3 == 0 {
                frame = CGRect(x: centerPoint - 75, y: yOffset, width: itemWidth, height: itemHeight)
                yOffset = yOffset + 125.0
            } else{
                if item % 3 == 1{
                    frame = CGRect(x: centerPoint - 155, y: yOffset, width: itemWidth, height: itemHeight)
                } else {
                     frame = CGRect(x: centerPoint + 5, y: yOffset, width: itemWidth, height: itemHeight)
                    yOffset = yOffset + 125.0
                }
            }
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexpath)
            attributes.frame = frame
            cache.append(attributes)
            contentHeight = max(contentHeight, frame.maxY)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
         var visiblelayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                    visiblelayoutAttributes.append(attributes)
            }
        }
        return visiblelayoutAttributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
