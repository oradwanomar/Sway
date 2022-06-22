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
    
    lazy var shadowView: UIView = {
        let offer = UIView()
        offer.translatesAutoresizingMaskIntoConstraints = false
        offer.backgroundColor = .systemBackground
        offer.layer.cornerRadius = 8
        offer.layer.borderWidth = 0.6
        offer.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        offer.layer.shadowColor = UIColor.label.withAlphaComponent(0.4).cgColor
        offer.layer.shadowOffset = CGSize(width: 0, height: 4)
        offer.layer.shadowOpacity = 1
        offer.layer.shadowRadius = 5
        return offer
    }()
    
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
        addSubview(shadowView)
        shadowView.addSubview(bannerImage)
        shadowView.setUp(to: self)
        bannerImage.setUp(to: shadowView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
