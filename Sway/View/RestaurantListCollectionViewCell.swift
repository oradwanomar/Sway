//
//  RestaurantListCollectionViewCell.swift
//  Sway
//
//  Created by Omar Ahmed on 14/06/2022.
//

import UIKit

class RestaurantListCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RestaurantListCollectionViewCell"
    var benefitHeightConstrains: NSLayoutConstraint?
    var locationHeightConstrains: NSLayoutConstraint?
    
    var cellData : RestaurantListModel? {
        didSet {
            guard let cellData = cellData else {return}
            print(cellData)
        }
    }
    
    //MARK: Prop
    lazy var restaurantImageCard: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    lazy var restaurantImgCover: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        return img
    }()
    
    lazy var offerView: UIView = {
        let offer = UIView()
        offer.translatesAutoresizingMaskIntoConstraints = false
        offer.backgroundColor = .systemBackground
        offer.layer.cornerRadius = 5
        offer.layer.borderWidth = 0.6
        offer.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        offer.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        offer.layer.shadowOffset = CGSize(width: 0, height: 4)
        offer.layer.shadowOpacity = 1
        offer.layer.shadowRadius = 5
    
        return offer
    }()
    
    let offerLabel: UILabel = {
        let o = UILabel()
        o.translatesAutoresizingMaskIntoConstraints = false
        o.textAlignment = .center
        o.numberOfLines = 2
        return o
    }()
    
    lazy var restaurantName: UILabel = {
        let res = UILabel()
        res.translatesAutoresizingMaskIntoConstraints = false
        res.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        res.textColor = .label
        return res
    }()
    
    let restaurantInfoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let restaurantTagLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        l.textColor = .darkGray.withAlphaComponent(0.8)
        return l
    }()
    
    let restaurantLocationLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .darkGray.withAlphaComponent(0.8)
        l.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        return l
    }()
    
    let benefitView: UIView = {
        let bn = UIView()
        bn.translatesAutoresizingMaskIntoConstraints = false
        bn.layer.cornerRadius = 8
        bn.layer.cornerCurve = .continuous
        bn.layer.masksToBounds = true
        return bn
    }()
    
    let gradientView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let benefitIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "ic_benefit")
        return img
    }()
    
    let benefitLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .orange
        l.font = UIFont.systemFont(ofSize: 13,weight: .bold)
        return l
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpConstrains()
    }
    
    func configure(){
        addSubview(restaurantImageCard)
        restaurantImageCard.addSubview(restaurantImgCover)
        addSubview(offerView)
        offerView.addSubview(offerLabel)
        addSubview(restaurantName)
        addSubview(restaurantInfoLabel)
        addSubview(restaurantTagLabel)
        addSubview(restaurantLocationLabel)
        
        addSubview(benefitView)
        benefitView.addSubview(gradientView)
        benefitView.addSubview(benefitIcon)
        benefitView.addSubview(benefitLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) { [self] in
            gradientView.setGradient(withColors: [UIColor.white.withAlphaComponent(0).cgColor, UIColor.orange.withAlphaComponent(0.2).cgColor], startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 1.0))
        }
        
    }
    
    func setUpConstrains(){
        restaurantImgCover.setUp(to: restaurantImageCard)
        offerLabel.setUp(to: offerView)
        gradientView.setUp(to: benefitView)
        
        NSLayoutConstraint.activate([
            restaurantImageCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImageCard.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            restaurantImageCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            restaurantImageCard.widthAnchor.constraint(equalToConstant: 100),
            
            offerView.leadingAnchor.constraint(equalTo: restaurantImageCard.leadingAnchor, constant: 5),
            offerView.trailingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: -5),
            offerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            offerView.heightAnchor.constraint(equalToConstant: 32),
            
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
