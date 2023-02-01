//
//  BottomCollectionViewCell.swift
//  SmartHome
//
//  Created by Mac on 31/01/2023.
//

import UIKit

protocol NavigationDelegate: AnyObject {
    func push(vc: UIViewController)
}

class BottomCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: BottomCollectionViewCell.self)
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelNameCell: UILabel!
    @IBOutlet weak var collectionCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.collectionCellView.layer.cornerRadius = 11.0
        
        self.collectionCellView.layer.masksToBounds = true
        
    }
    
    func setupData(type: EnumNames) {
        labelNameCell.text = type.title
        imageCell.image = type.image
        self.contentView.layer.cornerRadius = 2.0
        
        self.contentView.layer.masksToBounds = true
    }

}
