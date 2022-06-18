//
//  FilterHeaderView.swift
//  Sway
//
//  Created by Omar Ahmed on 16/06/2022.
//

import UIKit

protocol FilterActionDelegate: AnyObject {
    func didTabFilterBTN()
}

class FilterHeaderView: UICollectionReusableView {
    
    //MARK: Properities
    
    static let headerIdentifier = "FilterHeaderView"
    
    var leadingConstraints: NSLayoutConstraint?
    var trailingConstraints: NSLayoutConstraint?
    weak var delegate: FilterActionDelegate?
    
    var isSticky: Bool? {
        didSet{
            guard let isSticky = isSticky else {
                return
            }
            if isSticky {
                divider.isHidden = false
                leadingConstraints?.constant = 17
                trailingConstraints?.constant = -17
            }else {
                divider.isHidden = true
                leadingConstraints?.constant = 2
                trailingConstraints?.constant = -2
            }
        }
    }
    
    
    lazy var allRestaurants : UILabel = {
        let label = UILabel()
    
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label.withAlphaComponent(0.8)
        label.text = "All Restaurants".uppercased()
        label.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        return label
    }()
    
    lazy var filterIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "ic_setting")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .label.withAlphaComponent(0.8)
        return img
    }()
    
    lazy var filterBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sort/Filter", for: .normal)
        btn.setTitleColor(.label.withAlphaComponent(0.8), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        btn.addTarget(self, action: #selector(filterBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var divider: UIView = {
        let d = UIView()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.backgroundColor = .secondaryLabel
        d.isHidden = true
        return d
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        [allRestaurants,filterIcon,filterBtn,divider].forEach{addSubview($0)}
        setUpConstrains()
    }
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            allRestaurants.centerYAnchor.constraint(equalTo: centerYAnchor),
            allRestaurants.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -10),
            
            filterBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.4),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            filterIcon.widthAnchor.constraint(equalToConstant: 25),
            filterIcon.heightAnchor.constraint(equalToConstant: 25),
            filterIcon.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -3),
            filterIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        leadingConstraints = allRestaurants.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        leadingConstraints?.isActive = true

        trailingConstraints = filterBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2)
        trailingConstraints?.isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func filterBtnPressed(){
        delegate?.didTabFilterBTN()
    }
    
}
