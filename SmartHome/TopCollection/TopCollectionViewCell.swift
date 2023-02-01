//
//  TopCollectionViewCell.swift
//  SmartHome
//
//  Created by Mac on 31/01/2023.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: TopCollectionViewCell.self)
    
    @IBOutlet weak var labelTopCollection: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setName(massTopCollection: String) {
        
        labelTopCollection.text = massTopCollection
        
    }

}
