//
//  RestaurantVeganCollectionViewCell.swift
//  Sway
//
//  Created by Omar Ahmed on 06/07/2022.
//

import UIKit

class RestaurantVeganCollectionViewCell: UICollectionViewCell {
    
    // MARK: PROPERTIES -
    static let cellIdentifier = "RestaurantVeganCollectionViewCell"
    
    var cellData: VeganRestaurantModel? {
        didSet {
            guard let cellData = cellData else { return }
            restaurantImage.image = UIImage(named: cellData.coverImage)
            title.text = cellData.restaurantName
            subtitle.text = cellData.categoryTags
        }
    }
    
    let restaurantImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Restaurant Name"
        l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        l.textColor = .label
        l.textAlignment = .center
        return l
    }()
    
    let dividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .label
        return v
    }()
    
    let subtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "North India, Punjabi"
        l.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        l.textColor = .gray
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(restaurantImage)
        addSubview(title)
        addSubview(dividerView)
        addSubview(subtitle)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print(self.frame.size.width)
        }
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            restaurantImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantImage.heightAnchor.constraint(equalToConstant: 145),
            restaurantImage.topAnchor.constraint(equalTo: topAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: 30),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 30),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 25),
            
            subtitle.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 15),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
