//
//  FoodTopBannerCollectionViewCell.swift
//  Sway
//
//  Created by Omar Ahmed on 13/06/2022.
//

import UIKit

class FoodTopBannerCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properities
    
    static let cellIdentifier = "FoodTopBannerCollectionViewCell"
    
    var cellData : FoodTopBannerModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            bannerImage.image = UIImage(named: cellData.image)
        }
    }
    
    let bannerImage : UIImageView = {
        let bI = UIImageView()
        bI.translatesAutoresizingMaskIntoConstraints = false
        bI.backgroundColor = .systemBackground
        bI.clipsToBounds = true
        bI.contentMode = .scaleAspectFill
        bI.layer.cornerRadius = 8
        
        return bI
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(bannerImage)
        bannerImage.setUp(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
