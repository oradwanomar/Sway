//
//  FoodCategoryCollectionViewCell.swift
//  Sway
//
//  Created by Omar Ahmed on 14/06/2022.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properities
    
    static let cellIdentifier = "FoodCategoryCollectionViewCell"
    
    var cellData : FoodCategoryModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            categoryImgView.image = UIImage(named: cellData.categoryImage)
            categoryLabel.text = cellData.categoryName
        }
    }
    
    lazy var categoryImgView : UIImageView = {
        let catImg = UIImageView()
        catImg.translatesAutoresizingMaskIntoConstraints = false
        catImg.contentMode = .scaleAspectFit
        catImg.clipsToBounds = true
        catImg.layer.cornerRadius = 3
        return catImg
    }()
    
    lazy var categoryLabel : UILabel = {
        let catLabel = UILabel()
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.font = UIFont.systemFont(ofSize: 10,weight: .light)
        catLabel.numberOfLines = 2
        catLabel.textAlignment = .center
        catLabel.textColor = .label.withAlphaComponent(0.8)
        return catLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureConstrains()
    }
    
    func configureCell(){
        self.backgroundColor = .clear
        addSubview(categoryImgView)
        addSubview(categoryLabel)
    }
    
    func configureConstrains(){
        
        NSLayoutConstraint.activate([
            categoryImgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryImgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryImgView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            categoryImgView.heightAnchor.constraint(equalToConstant: 45),
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            categoryLabel.topAnchor.constraint(equalTo: categoryImgView.bottomAnchor, constant: 3),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
