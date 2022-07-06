//
//  VeganSectionHeaderView.swift
//  Sway
//
//  Created by Omar Ahmed on 06/07/2022.
//

import UIKit

class VeganSectionHeaderView: UICollectionReusableView {
    
    // MARK: PROPERTIES -
    static let headerIdentifier = "VeganSectionHeaderView"

    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.text = "vegetarian meals".uppercased()
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textAlignment = .center
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
        backgroundColor = .clear
        addSubview(title)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
