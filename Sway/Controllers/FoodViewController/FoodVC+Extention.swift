//
//  FoodVC+Extention.swift
//  Sway
//
//  Created by Omar Ahmed on 13/06/2022.
//

import Foundation
import UIKit

extension FoodViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return foodTopBannerMockData.count
        case 1 :
            return foodCategoryMockData.count
        default:
            return restaurantListMockData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier, for: indexPath) as? FoodTopBannerCollectionViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = foodTopBannerMockData[indexPath.row]
             return cell
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? FoodCategoryCollectionViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = foodCategoryMockData[indexPath.row]
             return cell
            
        default:
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantListCollectionViewCell.cellIdentifier, for: indexPath) as? RestaurantListCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = restaurantListMockData[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterHeaderView.headerIdentifier, for: indexPath) as! FilterHeaderView
            header.delegate = self
            return header
        }else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DividerFooterView.footerIdentifier, for: indexPath) as! DividerFooterView
            
            return footer
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FoodTopBannerCollectionViewCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.bannerImage.transform = .init(scaleX: 0.95, y: 0.95)
            }
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? RestaurantListCollectionViewCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.restaurantImgCover.transform = .init(scaleX: 0.95, y: 0.95)
                cell.offerView.transform = .init(scaleX: 0.95, y: 0.95)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? FoodTopBannerCollectionViewCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.bannerImage.transform = .identity
            }
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? RestaurantListCollectionViewCell {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.restaurantImgCover.transform = .identity
                cell.offerView.transform = .identity
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offestY = scrollView.contentOffset.y
        if abs(offestY) > 350 {
            filterHeaderView.isHidden = false
            filterHeaderView.isSticky = true
        }else {
            filterHeaderView.isHidden = true
            filterHeaderView.isSticky = false
        }
    }
    
    
}
