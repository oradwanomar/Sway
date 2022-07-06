//
//  DividerFooterView.swift
//  Sway
//
//  Created by Omar Ahmed on 16/06/2022.
//

import UIKit

class DividerFooterView: UICollectionReusableView {
    
    //MARK: Properties
    
    static let footerIdentifier = "DividerFooterView"
    
    lazy var footer: UIView = {
        let f = UIView()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.backgroundColor = .label.withAlphaComponent(0.8)
        return f
    }()
    
    //MARK: Main LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footer)
        setUpConstrains()
    }
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor),
            footer.heightAnchor.constraint(equalToConstant: 2),
            footer.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
