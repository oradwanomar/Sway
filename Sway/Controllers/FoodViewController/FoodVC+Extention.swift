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
        return foodTopBannerMockData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        default:
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier, for: indexPath) as? FoodTopBannerCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = foodTopBannerMockData[indexPath.row]
            return cell
        }
    }
    
    
}
