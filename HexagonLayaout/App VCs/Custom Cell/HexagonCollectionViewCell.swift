//
//  HexagonCollectionViewCell.swift
//  HexagonLayout
//
//  Created by BS126 on 12/3/18.
//  Copyright © 2018 BS23. All rights reserved.
//

import UIKit

protocol ClickedOncategoryDelegate {
    func clickedOncategory(cell: HexagonCollectionViewCell)
}
class HexagonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hexagonBackgroundView: UIView!
    @IBOutlet weak var hexagonView: UIControl!
    var delegate: ClickedOncategoryDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.autoresizingMask.insert(.flexibleHeight)
        self.contentView.autoresizingMask.insert(.flexibleWidth)
    }
    
    @IBAction func clikedOnCell(_ sender: UIControl) {
        delegate.clickedOncategory(cell: self)
    }
}
