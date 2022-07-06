//
//  ViewController.swift
//  Sway
//
//  Created by Omar Ahmed on 13/06/2022.
//

import UIKit

class FoodViewController: UIViewController {
    
    // MARK: Properties
    
    let navigationView : UIView = {
        let nv = UIView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.backgroundColor = .systemBackground
        return nv
    }()
    
    lazy var filterHeaderView: FilterHeaderView = {
        let filter = FilterHeaderView()
        filter.translatesAutoresizingMaskIntoConstraints = false
        filter.isHidden = true
        filter.delegate = self
        return filter
    }()
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(FoodTopBannerCollectionViewCell.self, forCellWithReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier)
        cv.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier)
        cv.register(RestaurantListCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantListCollectionViewCell.cellIdentifier)
        
        cv.register(FilterHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: FilterHeaderView.headerIdentifier)
        cv.register(DividerFooterView.self, forSupplementaryViewOfKind: "Footer", withReuseIdentifier: DividerFooterView.footerIdentifier)
        cv.register(VeganSectionHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: VeganSectionHeaderView.headerIdentifier)
        cv.register(RestaurantVeganCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantVeganCollectionViewCell.cellIdentifier)
        
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpNavigation()
        setUpConstrains()
        configureCompositionalLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavigation()
    }
    
    func setUpNavigation(){
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        btn.setButtonTitleWithRightImage(title: "Home", btnImage: "ic_arrow_down", customFont: UIFont.systemFont(ofSize: 20,weight: .bold), color: .label, imageColor: .label, imageSize: 20)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(navigationView)
        view.addSubview(collectionView)
        view.addSubview(filterHeaderView)
    }
    
    func setUpConstrains(){
        collectionView.setUp(to: view)
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: -(windowConstant.getTopPadding + 64)),
            navigationView.heightAnchor.constraint(equalToConstant: windowConstant.getTopPadding + 64),
            
            filterHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterHeaderView.heightAnchor.constraint(equalToConstant: 45),
        ])
    }


}

extension FoodViewController {
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return AppLayouts.shared.foodBannerSection()
            case 1 :
                return AppLayouts.shared.foodCategorySection()
            case 2 :
                return AppLayouts.shared.restaurantsListSection()
            default:
                return AppLayouts.shared.VeganSectionLayout()
            }
        }
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: "SectionBackground")
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension FoodViewController: FilterActionDelegate {
    func didTabFilterBTN() {
        print("Open Filter")
    }
}
