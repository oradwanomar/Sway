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
        default:
            return foodCategoryMockData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier, for: indexPath) as? FoodTopBannerCollectionViewCell else {fatalError("Unable deque cell...")}
             cell.cellData = foodTopBannerMockData[indexPath.row]
             return cell
        default:
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? FoodCategoryCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = foodCategoryMockData[indexPath.row]
            return cell
        }
    }
    
    
}
