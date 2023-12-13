//
//  MainScreenViewController.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

final class MainScreenViewController: UIViewController {
    private lazy var mainView = MainScreenView(subscriber: self)
    
    private lazy var promoSectionImages = [
        "pizzaImage",
        "saladImage",
        "breakfastImage",
        "sandwichImage",
        "bakeryImage",
        "pizzaImage",
        "saladImage",
    ]
    private lazy var promoSectionNames = [
        "Летний пикник",
        "Летний обед",
        "На завтрак",
        "На ужин",
        "Летний пикник",
        "Летний обед",
        "На завтрак",
    ]
    private lazy var promoBannerImages = [
        "promoBannerImage",
        "promoBannerImage2",
        "promoBannerImage",
        "promoBannerImage2",
        "promoBannerImage",
        "promoBannerImage2",
        "promoBannerImage",
    ]
    private lazy var catalogImages = [
        "catalogImage1",
        "catalogImage2",
        "catalogImage3",
        "catalogImage4",
        "catalogImage5",
        "catalogImage6",
        "catalogImage7",
        "catalogImage8",
        "catalogImage9"
    ]
    private lazy var catalogNames = [
        "Наборы",
        "Пицца",
        "Паста",
        "Ризотто",
        "Салаты",
        "Полуфабрикаты",
        "Десерты",
        "Добавки к блюдам",
        "Напитки"
    ]
    private lazy var stocks = [StockData]()
    
    override func loadView() {
        super.loadView()
        
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStocksData()
        
        self.mainView.promoSectionsCollectionView.delegate = self
        self.mainView.promoSectionsCollectionView.dataSource = self
        
        self.mainView.promoBannersCollectionView.delegate = self
        self.mainView.promoBannersCollectionView.dataSource = self
        
        self.mainView.stocksCollectionView.delegate = self
        self.mainView.stocksCollectionView.dataSource = self
        
        self.mainView.catalogCollectionView.delegate = self
        self.mainView.catalogCollectionView.dataSource = self
    }
    
    private func setStocksData() {
        self.stocks = [
            StockData(
                imageName: "dishImage1",
                dishName: "Черные спагетти с морепродуктам (большая порция)",
                weight: 230,
                oldPrice: 360,
                newPrice: 200,
                percent: 25,
                isNew: true),
            StockData(
                imageName: "dishImage2",
                dishName: "Казаречче с индейкой и томатами",
                weight: 230,
                oldPrice: 360,
                newPrice: 200,
                percent: 25,
                isNew: false),
            StockData(
                imageName: "dishImage3",
                dishName: "Равиоли с грибами",
                weight: 230,
                oldPrice: 1360,
                newPrice: 1200,
                percent: 35,
                isNew: false),
            StockData(
                imageName: "dishImage1",
                dishName: "Черные спагетти с морепродуктам (большая порция)",
                weight: 230,
                oldPrice: 360,
                newPrice: 200,
                percent: 25,
                isNew: true),
            StockData(
                imageName: "dishImage2",
                dishName: "Казаречче с индейкой и томатами",
                weight: 230,
                oldPrice: 360,
                newPrice: 200,
                percent: 25,
                isNew: false),
            StockData(
                imageName: "dishImage3",
                dishName: "Равиоли с грибами",
                weight: 230,
                oldPrice: 1360,
                newPrice: 1200,
                percent: 35,
                isNew: false),
            StockData(
                imageName: "dishImage1",
                dishName: "Черные спагетти с морепродуктам (большая порция)",
                weight: 230,
                oldPrice: 360,
                newPrice: 200,
                percent: 25,
                isNew: true),
        ]
    }
    
    @objc
    func addButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? StocksCollectionViewCell else {
            return
        }
        cell.countView.isHidden = false
        cell.minusButton.isHidden = false
        cell.plusButton.isHidden = false
        cell.priceStackView.isHidden = true
        cell.sumLabel.isHidden = false
        
        cell.count += 1
        cell.countLabel.text = "\(cell.count)"
    }
    
    @objc
    func addToCartProduct(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? StocksCollectionViewCell else {
            return
        }
        if sender.tag == 1 {
            cell.count -= 1
            
            if cell.count == 0 {
                cell.countView.isHidden = true
                cell.minusButton.isHidden = true
                cell.plusButton.isHidden = true
                cell.priceStackView.isHidden = false
                cell.sumLabel.isHidden = true
                cell.weightStackView.removeArrangedSubview(cell.sumLabel)
                cell.sumLabel.removeFromSuperview()
            } else {
                cell.countLabel.text = "\(cell.count)"
            }
        } else if sender.tag == 2 {
            cell.count += 1
            
            cell.countLabel.text = "\(cell.count)"
        }
    }
}

extension MainScreenViewController: MainScreenDelegate {
    func menuButtonTapped(_ sender: UIButton) {
        
    }
    
    func moreButtonTapped(_ sender: UIButton) {
        print("the cell in the promoSectionsCollectionView is pressed")
    }
    
    func heartButtonTapped(_ sender: UIButton) {
        print("the heartButton is pressed")
    }
    
    func showAllButtonTapped(_ sender: UIButton) {
        print("the showAll is pressed")
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mainView.promoSectionsCollectionView {
            return self.promoSectionNames.count
        } else if collectionView == self.mainView.promoBannersCollectionView {
            return self.promoBannerImages.count
        } else if collectionView == self.mainView.stocksCollectionView {
            return self.stocks.count
        } else {
            return self.catalogNames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.mainView.promoSectionsCollectionView {
            print("the cell in the promoSectionsCollectionView is pressed")
        } else if collectionView == self.mainView.promoBannersCollectionView {
            print("the cell in the promoBannersCollectionView is pressed")
        } else if collectionView == self.mainView.stocksCollectionView {
            print("the cell in the stocksCollectionView is pressed")
        } else {
            print("the cell in the сatalogCollectionView is pressed")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainView.promoSectionsCollectionView {
            let cell: PromoSectionsCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            return cell
        } else if collectionView == self.mainView.promoBannersCollectionView {
            let cell: PromoBannersCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            return cell
        } else if collectionView == self.mainView.stocksCollectionView {
            let cell: StocksCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            cell.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
            cell.minusButton.addTarget(self, action: #selector(addToCartProduct), for: .touchUpInside)
            cell.plusButton.addTarget(self, action: #selector(addToCartProduct), for: .touchUpInside)
            return cell
        } else {
            let cell: CatalogCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == self.mainView.promoSectionsCollectionView {
            let image = self.promoSectionImages[indexPath.item]
            let title = self.promoSectionNames[indexPath.item]
            (cell as? PromoSectionsCollectionViewCell)?.configure(image, title)
        } else if collectionView == self.mainView.promoBannersCollectionView {
            let image = self.promoBannerImages[indexPath.item]
            (cell as? PromoBannersCollectionViewCell)?.configure(image)
        } else if collectionView == self.mainView.stocksCollectionView {
            let dishImage = self.stocks[indexPath.item].imageName
            let dishName = self.stocks[indexPath.item].dishName
            let weight = self.stocks[indexPath.item].weight
            let oldPrice = self.stocks[indexPath.item].oldPrice
            let newPrice = self.stocks[indexPath.item].newPrice
            let percent = self.stocks[indexPath.item].percent
            let isNew = self.stocks[indexPath.item].isNew
            (cell as? StocksCollectionViewCell)?.configure(dishImage, dishName, weight, oldPrice, newPrice, percent, isNew)
        } else {
            let image = self.catalogImages[indexPath.item]
            let title = self.catalogNames[indexPath.item]
            (cell as? CatalogCollectionViewCell)?.configure(image, title)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.mainView.promoSectionsCollectionView {
            return 20
        } else if collectionView == self.mainView.promoBannersCollectionView {
            return 8
        } else if collectionView == self.mainView.stocksCollectionView {
            return 10
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.mainView.catalogCollectionView {
            return 5
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.mainView.promoSectionsCollectionView {
            return CGSize(width: 80, height: 95)
        } else if collectionView == self.mainView.promoBannersCollectionView {
            return CGSize(width: 290, height: 115)
        } else if collectionView == self.mainView.stocksCollectionView {
            return CGSize(width: 102, height: 208)
        } else {
            return CGSize(width: 108, height: 135)
        }
    }
}
