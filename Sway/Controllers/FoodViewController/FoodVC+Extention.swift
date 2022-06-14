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
    
    
}
